module ApplicationHelper
  def user_can_manage_content?
  	current_user.admin?
  end

  def destination_path(destination)
    destination_by_name_path(destination)
  end

  def experience_path(experience)
    experience_by_name_path(experience)
  end

  def destination_by_name_path(destination)
    super(destination.url_name)
  end

  def experience_by_name_path(experience)
    super(experience.destination.url_name, experience.url_name)
  end
end
