class ConfirmationsController < ApplicationController
  before_action :set_hangout
  before_action :set_confirmation, only: [:edit, :update, :destroy]

  def new
    if @hangout.confirmations.where('user_id = ?', current_user).count == 0
      @confirmation = Confirmation.new
      authorize @confirmation
    else
      redirect_to hangout_path(@hangout)
    end
  end

  def create
    @confirmation= Confirmation.new(confirmation_params)
    @confirmation.user = current_user
    @confirmation.hangout = @hangout

    authorize @confirmation

    if @confirmation.save
      redirect_to hangout_path(@hangout)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def set_confirmation
    @confirmation = Confirmation.find(params[:id])
  end

    def set_hangout
    @hangout = Hangout.find(params[:hangout_id])
  end

  def confirmation_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:confirmation).permit(:leaving_address, :transportation, :latitude, :longitude)
  end
end
