class ManagementPolicy < ApplicationPolicy
  def index
    user.admin?
  end

  def destinations
  	user.admin?
  end

  def experiences
    user.admin?
  end
end 
