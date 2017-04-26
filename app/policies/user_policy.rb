class UserPolicy < ApplicationPolicy


#only for Index or specific show
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record == user  # Anyone Logged In can view his own profile
  end


end
