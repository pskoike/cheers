class PlacePolicy < ApplicationPolicy


#only for Index or specific show
  class Scope < Scope
    def resolve
      scope.all
    end
  end

#  def show?
#    true  # Anyone Logged In can view a place
#  end
#
#  def create?
#    false  # Only Admin can create a place
#  end
#
#  def update?
#    false  # Only Admin can update a place
#  end
#
#  def destroy?
#    false  # Only Admin can delete a place
#  end

end
