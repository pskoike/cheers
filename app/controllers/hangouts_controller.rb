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
          redirect_to new_hangout_confirmation_path(@hangout)
       else
         render :new
       end
     end
  end

def show

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
