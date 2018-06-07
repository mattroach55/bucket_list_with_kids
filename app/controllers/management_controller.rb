class ManagementController < ApplicationController
  before_action :authenticate_admin!

  def index
    skip_policy_scope
    authorize :management, :index
  end

  def destinations
    policy_scope(Destination)
    authorize :management, :destinations

    @destinations = Destination.all # TODO paginate
  end

  def destination_experiences
    policy_scope(Destination)
    authorize :management, :experiences

    @destination = Destination.find_by_url_name(params[:destination_id])
    @experiences = @destination.experiences
  end
end
