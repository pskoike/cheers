class HangoutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new, :index, :show]
  before_action :set_hangout, only: [:show, :edit, :update, :destroy]

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
       @hangout.user = current_user
       if @hangout.save
          redirect_to hangouts_path
       else
         render :new
       end
     end
  end

def show
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
end


  private

  def hangout_params
    params.require(:hangout).permit(:title, :date, :category, :center_address)
  end

  def set_hangout
    @hangout = Hangout.find(params[:id])
    authorize @hangout
  end

end
