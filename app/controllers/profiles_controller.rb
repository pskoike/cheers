class ProfilesController < ApplicationController

  def show
    @user = current_user
    authorize @user
    @hangouts_as_host = @user.hangouts

    @confirmations_as_guest = []
    @user.confirmations.each do |conf|
      if conf.hangout.user != @user
        @confirmations_as_guest << conf
      end
    @confirmations_as_guest
    end
  end



end
        #Hangout.where("DATE(date) < ?", '2018-04-26')
