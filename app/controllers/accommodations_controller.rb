class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :edit, :update, :photo, :destroy]
  before_action :set_destination, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    policy_scope(Accommodation)

    if params[:query].present?
      @accommodations = Accommodation.search_by_name_description(params[:query])
    else
      @accommodations = Accommodation.all
    end
  end

  def show
    @review = Review.new
  end

  def new
    @accommodations = Accommodation.new
    authorize @accommodations
  end

  def create
    @accommodation = Accommodation.new(params_accommodation)
    @accommodation.destination = @destination
    @accommodation.user = current_user
    authorize @accommodation
    if @accommodation.save
      redirect_to accommodation_path(@accommodation)
    else
      render :new
    end
  end

  def photo
  end

  def edit
    authorize @accommodation
  end

  def update
    authorize @accommodation
    if @accommodation.update(params_accommodation)
      redirect_to accommodation_path(@accommodation)
    else
      render :new
    end
  end

  def destroy
    authorize @accommodation
    @accommodation.destroy
    redirect_to accommodations_path
  end

private

  def set_destination
    @destination = Destination.find(params[:destination_id])
  end

  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  def params_accommodation
    params.require(:accommodation).permit(:name, :entity, :show, :description, :street_number, :street, :locality, :country, :region, :latitude, :longitude, :photo, :holiday_type, :theme, :kids_age_from, :kids_age_to, :duration, :price, :kids_club, :kids_menu, :connecting_rooms, :pool, :beach, :bucket_list_count, :average_review_score, :booking_link, :destination_id, :user_id)
  end

end

