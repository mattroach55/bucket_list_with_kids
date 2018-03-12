class UsersController < ApplicationController
  before_action :authenticate_user!

  def bucketlist
    @experiences = current_user.bucket_list_items.where("experience_id is not null")
    @accommodations = current_user.bucket_list_items.where("accommodation_id is not null")
    @destinations = current_user.bucket_list_items.where(accommodation: nil, experience: nil)
    @user = current_user
    @bucket = current_user.bucket_list_items
    authorize @user
  end

  def profile
    @experiences = current_user.experiences
    @accommodations = current_user.accommodations
    @destinations = current_user.destinations
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end
end
