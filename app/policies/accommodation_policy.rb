class AccommodationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.admin
  end

  def show
    true
  end

  def create?
    user.admin
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
