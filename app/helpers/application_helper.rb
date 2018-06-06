module ApplicationHelper
  def user_can_manage_content?
  	current_user.admin?
  end

  def experience_path(experience)
    super(experience.destination, experience)
  end
end
