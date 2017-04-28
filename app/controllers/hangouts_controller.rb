class HangoutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new, :index, :show]

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
      @hangout.status = "confirmations_on_going"
      authorize @hangout
      #  redirect_to new_user_session_path
      redirect_to user_facebook_omniauth_authorize_path
     else
      @hangout = Hangout.new(hangout_params)
      @hangout.status = "confirmations_on_going"
      authorize @hangout
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
    if (@hangout.date + 6 * 60 * 60) < Time.now #add 6hours in order not to put the hg in past right away
      @render = 'past'
    else
      if @hangout.status == "confirmations_on_going"
        @render = 'confirmationfollowup'

        @confirmations = Confirmation.all.where('hangout_id = ?',@hangout.id)
        @confirmation_markers = []
        @confirmations.each do |confirmation|
          @confirmation_markers << {lat: confirmation.latitude, lng: confirmation.longitude}
        end

        nb = @confirmations.count
        avg_lat = @confirmations.reduce(0){ |sum, el| sum + el.latitude }.to_f / nb
        avg_ln = @confirmations.reduce(0){ |sum, el| sum + el.longitude }.to_f / nb
        @center = {lat: avg_lat, lng: avg_ln}

        delta_lat = (@confirmations.max_by {|x| x.latitude}).latitude - (@confirmations.min_by {|x| x.latitude}).latitude
        delta_lng = (@confirmations.max_by {|x| x.longitude}).longitude - (@confirmations.min_by {|x| x.longitude}).longitude

        raw_radius = (delta_lat + delta_lng) / 4

        magic_factor = 20000

        @radius = raw_radius * magic_factor

        @hangout.latitude = @center[:lat]
        @hangout.longitude = @center[:lng]
        @hangout.radius = @radius
        @hangout.save

      elsif @hangout.status == "vote_on_going"
        @render = 'vote_option'
      elsif @hangout.status == "result"
        @render = 'result'
      elsif @hangout.status == "cancelled"
        @render = 'cancelled'
      end
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
    @hangout.status = "result"
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
end
