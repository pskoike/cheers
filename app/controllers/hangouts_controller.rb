class HangoutsController < ApplicationController


private
  def past_hangout?
    self.date < Date.today
  end

end
