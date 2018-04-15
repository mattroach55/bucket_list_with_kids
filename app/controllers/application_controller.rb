# authentication
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end


  # OVERRIDING Rails.application.default_url_options[:host] FOR EXTERNAL WORLD (READ: SOCIAL MEDIA)
  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def authenticate_admin!
    authenticate_user!
    redirect_to(root_path) unless current_user.admin?
  end

# CODE FROM AUTHENTICATION SLIDES FOR ADDING CUSTOM FIELDS TO DEVISE LOGIN (SLIDE 5-3)

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :photo, :password, :password_confirmation, :current_password])
  end
end
