class ProfilesController < ApplicationController

  def show
    @user = current_user
    @hangouts_as_host = @user.hangouts

    @hangouts_as_guest = []
    @user.confirmations.each do |conf|
      if conf.hangout.user != @user
        @hangouts_as_guest << conf.hangout
      end
    @hangouts_as_guest
    authorize @user
  end
end


end
        #Hangout.where("DATE(date) < ?", '2018-04-26')
