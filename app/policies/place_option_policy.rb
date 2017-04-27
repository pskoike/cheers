class PlaceOptionPolicy < ApplicationPolicy


#only for Index or specific show
  class Scope < Scope
    def resolve
      scope.all
    end
  end

#  def show?
#    true  # Anyone Logged In can view a place_option
#  end
#
#  def create?
#    false  # Only Admin can create a place_option
#  end
#
#  def update?
#    false  # Only Admin can update a place_option
#  end
#
#  def destroy?
#    false  # Only Admin can delete a place_option
#  end

end
