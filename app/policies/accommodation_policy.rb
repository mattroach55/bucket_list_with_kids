class AccommodationPolicy < ApplicationPolicy
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
    user.admin
  end

  def destroy?
    user.admin
  end
end
