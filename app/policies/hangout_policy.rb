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

 def set_hangout?
   true
 end

end
