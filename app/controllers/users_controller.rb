class UsersController < ApplicationController

  def bucketlist
    @experiences = current_user.experiences
    @accommodations = current_user.accommodations
    @destinations = current_user.destinations
    @user = current_user
    # authorize @user
  end
end
