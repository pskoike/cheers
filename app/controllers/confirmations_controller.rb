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
      if @hangout.user == current_user
        redirect_to share_hangout_path(@hangout)
      else
        redirect_to hangout_path(@hangout)
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
  end


