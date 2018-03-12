class DestinationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.admin
  end

  def show?
    true
  end

  def create?

  end

  def edit?
    user.admin
  end

  def upvote?
    true
  end

  def update?
    user.admin
  end

  def destroy?
    user.admin
  end

end
