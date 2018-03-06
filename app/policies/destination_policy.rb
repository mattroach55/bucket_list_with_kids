class DestinationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
  end

  def show
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
