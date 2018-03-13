class UsersController < ApplicationController
  before_action :authenticate_user!

  def bucketlist
    @user = current_user
    authorize @user
    @bucket = @user.bucket_list_items
    @experiences = @bucket.where.not(experience: nil)
    @accommodations = @bucket.where.not(accommodation: nil)
    @destinations = @bucket.where.not(destination: nil).where(accommodation: nil, experience: nil)
  end

  def profile
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
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
