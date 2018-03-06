class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @experiences = Experience.search_by_name_description(params[:query])
    else
    @destinations = Destination.all
    #future code to mix destination, accomdation and experiences
    end
  end

  def mix
    #future code
  end


  def show
    @markers = [{ lat: @destination.latitude, lng: @destination.longitude }]
  end

  def new
    @destinations = Destination.new
  end

  def create
    @destination = Destination.new(params_destination)
    @destination.user = current_user
    @destination.save
    redirect_to destinations_path(@destination)
  end

  def edit
    # authorize @experience
  end

  def update
    # authorize @destination
    if @destination.update(destination_params)
    redirect_to destination_path(@destination)
    else
    render :new
  end
 end

 def destroy
    authorize @destination
    @destination.destroy
    redirect_to experiences_path
  end

private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def params_destination
    params.require(:destination).permit(:name, :description, :street_number, :address, :locality, :country, :region, :latitude, :longitude, :photo, :type, :holiday_type, :theme, :kids_age_from, :kids_age_to, :duration, :price, :bucket_list_count, :average_review_score)
  end
end


