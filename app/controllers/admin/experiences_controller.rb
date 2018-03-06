class Admin::RestaurantsController < ApplicationController
  def index
    @experience = current_user.experience
  end
end
