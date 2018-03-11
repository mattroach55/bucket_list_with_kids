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
    user.admin
    # if user == nil
    #   false
    # elsif !user_is_admin?
    #   user
    # else
    #   user_is_admin?
    # end
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

  private

  def user_is_owner?
    record.user == user
  end

  def user_is_admin?
    user.admin == user
  end
end
