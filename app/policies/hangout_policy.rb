class HangoutPolicy < ApplicationPolicy

#only for Index or specific show
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def show?
    true  # Anyone can view a hangout
  end

  def create?
    true  # Anyone Logged In can create a hangout
  end

  def update?
    record.user == user
    # - record: the hangout passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def launch_vote?
    record.user == user
  end

  def cancel_hg?
    record.user == user
  end

  def set_hangout?
    true
  end

end
