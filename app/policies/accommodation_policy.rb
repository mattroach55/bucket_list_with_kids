class AccommodationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.admin? if user
  end

  def show
    true
  end

  def create?
   true
  end

  def upvote?
    true
  end

  def edit?
    user.admin? if user
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
