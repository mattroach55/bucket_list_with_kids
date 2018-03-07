class UserPolicy < ApplicationPolicy
  def bucketlist?
    true
  end

  def profile?
    true
  end
end
