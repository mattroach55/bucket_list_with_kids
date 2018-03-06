class Admin::AccommodationsController < ApplicationController
  def index
    @accomodations = current_user.accomodations
  end
end
