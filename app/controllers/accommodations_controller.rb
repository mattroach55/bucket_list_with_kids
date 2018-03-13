class AccommodationsController < ApplicationController
  before_action :set_destination, only: [:new, :create]
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]

  def index
    policy_scope(Accommodation)

    if params[:query].present?
      @accommodations = Accommodation.search_by_name_description(params[:query])
    else
      @accommodations = Accommodation.all
    end
  end

  def upvote
    @accommodation = Accommodation.find(params[:id])
    @destination = @accommodation.destination
    authorize @accommodation
    @accommodation.upvote_by(current_user)
    if current_user.bucket_list_items.where(accommodation: @accommodation).empty?
      @bucket = BucketListItem.new
      @bucket.user = current_user
      @bucket.accommodation = @accommodation
      @bucket.destination = @destination
      @bucket.save
    end
    redirect_to destinations_path
  end

  def show
    @review = Review.new
    # MAP CODE BELOW
    @markers = [{ lat: @accommodation.latitude, lng: @accommodation.longitude, infoWindow: { content: render_to_string(partial: "shared/marker_window", locals: { entity: @accommodation }) } }]
    # MAP CODE ABOVE
    authorize @accommodation
  end

  def new
    @accommodation = Accommodation.new
    authorize @accommodation
  end

  def create
    @accommodation = Accommodation.new(params_accommodation)
    @destination = Destination.find(params[:destination_id])
    @accommodation.destination = @destination
    @accommodation.user = current_user
    authorize @accommodation

    if @accommodation.save
      store_photos
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
  def store_photos
    photos = params[:accommodation][:photos]
    photos.each {|photo| @accommodation.photos.create(photo: photo)} if photos
  end

  def set_destination
    @destination = Destination.find(params[:destination_id])
  end

  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  def params_accommodation
    params.require(:accommodation).permit(:name, :entity, :show, :description, :street_number, :street, :locality, :country, :region, :latitude, :longitude, :holiday_type, :theme, :allowed_age_0_4, :allowed_age_5_7, :allowed_age_8_11, :allowed_age_12_15, :allowed_age_16_18, :duration, :price, :bucket_list_count, :average_review_score, :photos, :booking_link)
  end

end

