class HangoutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new, :show]

  before_action :set_hangout, only: [:show, :share, :edit, :update, :cancel_hg, :launch_vote, :submit_vote, :has_voted?,:close_vote]


  def new
    @hangout = Hangout.new
    authorize @hangout
  end

  def index
    @hangouts = policy_scope(Hangout)
  end

  def create
    if current_user.nil?
      session[:hangout] = params
      @hangout = Hangout.new
      authorize @hangout
      #  redirect_to new_user_session_path
      redirect_to user_facebook_omniauth_authorize_path
     else
      @hangout = Hangout.new(hangout_params)
      authorize @hangout
      @hangout.status = "confirmations_on_going"
      @hangout.user = current_user
      if @hangout.save
        redirect_to new_hangout_confirmation_path(@hangout)
      else
        render :new
      end
    end
  end

  def show
    #Render router:
    hg_confirmations = @hangout.confirmations.map {|x| x.user}
    if (@hangout.date + 6 * 60 * 60) > Time.now #add 6hours in order not to put the hg in past right away
      if current_user.nil?
        @render = 'invitation'
      else
        if hg_confirmations.include?(current_user)  #checking if current user has already a confirmation for this HG
          hangoutshow_by_status
        else
          @render = 'invitation'
        end
      end
    else
      @render = 'past'
    end
  end

  def submit_vote
    place = Place.find(params[:place_id])
    confirmation.place = place
    authorize @hangout
    @confirmation.save
    redirect_to hangout_path(@hangout)
  end

  def has_voted?
    confirmation.place.present?
  end
  helper_method :has_voted?

  def place_list
    @hangout.place_options
  end
  helper_method :place_list

  def voted_place
    confirmation.place
  end
  helper_method :voted_place

  def launch_vote
    # Call PlacesAPI to create place_options
    initialize_places_api
    @hangout.status = "vote_on_going"
    @hangout.save
    redirect_to hangout_path(@hangout)
    #Send notifications
  end

  def edit
  end

  def update
    @hangout.update_attributes(hangout_params)
    redirect_to hangout_path(@hangout)
    #Send notifications
  end

  def cancel_hg
    @hangout.status = "cancelled"
    @hangout.save
    redirect_to hangout_path(@hangout)
  end

  def close_vote

    votes = []
      @hangout.confirmations.each do |conf|
        if conf.place
         votes << conf.place
        end
      end
    counts = Hash.new 0
    votes.each do |place|
     counts[place] += 1
    end
    winner = counts.max_by{|k,v| v}[0] # put logic if there is 2 places with same vote
    @hangout.place = winner
    @hangout.status = "result"
    @hangout.save!
    redirect_to hangout_path(@hangout)
  end


  def share
  end

private

  def hangout_params
    params.require(:hangout).permit(:title, :date, :category, :center_address, :status)
  end

  def set_hangout
    @hangout = Hangout.find(params[:id])
    authorize @hangout
  end

  def confirmation
    @confirmation ||= Confirmation.find_by(user: @current_user, hangout: @hangout)
  end

  def hangoutshow_by_status
    if @hangout.status == "confirmations_on_going"
      @render = 'confirmationfollowup'

      #Building array of markets with leaving lat/lng of the confirmations
      @confirmations = Confirmation.all.where('hangout_id = ?',@hangout.id)
      @confirmation_markers = []
      @confirmations.each do |confirmation|
        @confirmation_markers << {lat: confirmation.latitude, lng: confirmation.longitude, mode: confirmation.transportation}
      end

      zone = fetch_zone(@confirmation_markers)
      @center = zone[:center]
      @radius= zone[:radius]
      @hangout.latitude = zone[:center][:lat]
      @hangout.longitude = zone[:center][:lng]
      @hangout.radius = zone[:radius]
      @hangout.save

      #Geting distance, duration to the center for each marker
      @confirmation_markers.each do |confirmation_marker|
        confirmation_marker = get_direction(confirmation_marker, @center, @hangout.date)
      end
      #recalcute center adjusting lat, lng with duration
      @adj_center = fetch_adjusted_zone(@confirmation_markers, @center)

      #one more iteration for accuracy
      @confirmation_markers.each do |confirmation_marker|
        confirmation_marker = get_direction(confirmation_marker, @adj_center,@hangout.date)
      end
      @adj_center2 = fetch_adjusted_zone(@confirmation_markers, @adj_center)

    elsif @hangout.status == "vote_on_going"
      @render = 'vote_option'
      @nb_conf = @hangout.confirmations.count
      @nb_vote = @hangout.confirmations.reduce(0) {|sum,conf| conf.place_id.nil? ? sum : sum  += 1}
    elsif @hangout.status == "result"
      @render = 'result'
      confirmation
      #@confirmation = @hangout.confirmations.select {|confirmation| confirmation.user == current_user}
      @transport = confirmation.transportation
      @departure = {lat: @confirmation.latitude, lng: @confirmation.longitude}
      @direction = {lat: @hangout.latitude, lng: @hangout.longitude}
    elsif @hangout.status == "cancelled"
      @render = 'cancelled'
    end
  end

  def initialize_places_api
    fetch = PlacesApi.new(@hangout)
    venues = fetch.fetch_places
    fetch.find_places(venues)
  end

  def fetch_zone(confirmation_markers)
    nb = confirmation_markers.count
    avg_lat = confirmation_markers.reduce(0){ |sum, el| sum + el[:lat]}.to_f / nb
    avg_ln = confirmation_markers.reduce(0){ |sum, el| sum + el[:lng]}.to_f / nb
    center = {lat: avg_lat, lng: avg_ln}

    delta_lat = (confirmation_markers.max_by {|x| x[:lat]})[:lat] - (confirmation_markers.min_by {|x| x[:lat]})[:lat]
    delta_lng = (confirmation_markers.max_by {|x| x[:lng]})[:lng] - (confirmation_markers.min_by {|x| x[:lng]})[:lng]
    raw_radius = (delta_lat + delta_lng) / 4
    magic_factor = 20000 #factor to size sensibility of the radius vs. distance between participants
    min_radius = 600
    radius = [raw_radius * magic_factor, min_radius].max
   return {center: center, radius: radius}
  end

  def fetch_adjusted_zone(confirmation_markers, center)
    div = confirmation_markers.reduce(0){ |sum, el| sum + el[:duration]}
    avg_lat = confirmation_markers.reduce(0){ |sum, el| sum + el[:lat]*el[:duration]}.to_f / div
    avg_ln = confirmation_markers.reduce(0){ |sum, el| sum + el[:lng]*el[:duration]}.to_f / div
    weighted_center = {lat: avg_lat, lng: avg_ln}
    adj_center = {lat: (weighted_center[:lat] + center[:lat]) / 2 , lng: (weighted_center[:lng] + center[:lng]) / 2 }
    return adj_center
  end

  def get_direction(departure, destination, departure_time)
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=#{departure[:lat]},#{departure[:lng]}&destinations=#{destination[:lat]},#{destination[:lng]}&departure_time=#{departure_time.to_i}&mode=#{departure[:mode].downcase}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    url.gsub!('"')
    direction = RestClient.get url
    direction_info = JSON.parse(direction)
    departure[:distance] = direction_info["rows"][0]["elements"][0]["distance"]["value"]
    if departure[:mode] == 'DRIVING'
      departure[:duration] = direction_info["rows"][0]["elements"][0]["duration_in_traffic"]["value"]
    else
      departure[:duration] = direction_info["rows"][0]["elements"][0]["duration"]["value"]
    end
    return departure
  end

end
