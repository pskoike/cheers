class HangoutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  before_action :set_hangout, only: [:show, :edit, :update, :destroy]

  def new
    @hangout = Hangout.new
    authorize @hangout
  end

  def create
    # if current_user.nil?
    #   session[:hangout] = params
    #   redirect_to new_user_registration_path
    # else
      @hangout = Hangout.new(hangout_params)
        if @hangout.save
          redirect_to root_path
        else
          render :new
      end
    # end
  end

  private

  def hangout_params
    params.require(:hangout).permit(:title, :date, :category, :center_address)
  end

  def set_hangout
    @hangout = Hangout.find(params[:id])
    # authorize @hangout
  end
end
