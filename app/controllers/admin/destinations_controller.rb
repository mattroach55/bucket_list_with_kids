class Admin::DestinationsController < ApplicationController
  def index
    @destinations = current_user.destinations
  end
end
