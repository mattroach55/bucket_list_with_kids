class UserPolicy < ApplicationPolicy
  def create?
    @current_user.admin?
  end

  def bucketlist?
    true
  end

  def profile?
    true
  end

  def edit?
    true
  end
end
