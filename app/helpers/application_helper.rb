module ApplicationHelper
  def user_can_manage_content?
  	current_user.admin?
  end
end
