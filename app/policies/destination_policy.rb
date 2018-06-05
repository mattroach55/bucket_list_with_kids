class DestinationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.admin? if user
  end

  def show?
    true
  end

  def create?
    user.admin? if user
  end

  def edit?
    user.admin? if user
  end

  def upvote?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

end
