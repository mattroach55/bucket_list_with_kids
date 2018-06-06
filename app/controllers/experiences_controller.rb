class ExperiencesController < ApplicationController
  before_action :set_destination, only: [:new, :create]
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]

  def index
    policy_scope(Experience)

    if params[:query].present?
      @experiences = Experience.search_by_name_description(params[:query])
    else
      @experiences = Experience.all
    end
  end

  def upvote
    @experience = Experience.find(params[:id])
    @destination = @experience.destination
    authorize @experience
    @experience.upvote_by(current_user)
    if current_user.bucket_list_items.where(experience: @experience).empty?
      @bucket = BucketListItem.new
      @bucket.user = current_user
      @bucket.experience = @experience
      @bucket.destination = @destination
      @bucket.save
    end
    redirect_to destinations_path(anchor: "main-results")
  end

  def show
    @accommodations = Accommodation.where(destination: @experience.destination)
    @experiences = Experience.where(destination: @experience.destination)
    authorize @experience
    # MAP CODE BELOW
    # @markers = [{ lat: @experience.latitude, lng: @experience.longitude, infoWindow: { content: @experience.name }}]
    @markers = [{ lat: @experience.latitude, lng: @experience.longitude, infoWindow: { content: render_to_string(partial: "shared/marker_window", locals: { selection: @experience }) } }]
    # MAP CODE ABOVE
    @review = Review.new

    render :show
  end

  def show_by_name
    @experience = Experience.where(url_name: params[:experience_name]).first
    show
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(params_experience)
    @destination = Destination.find(params[:destination_id])
    @experience.destination = @destination
    @experience.user = current_user
    authorize @experience
    if @experience.save
      store_photos
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def edit
    authorize @experience
  end

  def update
    @experience = Experience.find(params[:id])
    authorize @experience
    if @experience.update(params_experience)
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def destroy
    authorize @experience
    @experience.destroy
    redirect_to experiences_path
  end

  private

  def store_photos
    photos = params[:experience][:photos]
    photos.each {|photo| @experience.photos.create(photo: photo)} if photos
  end

  def set_destination
    @destination = Destination.find(params[:destination_id])
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def params_experience
    params.require(:experience).permit(:name, :entity, :show, :destination, :description, :street_number, :street, :locality, :country, :region, :latitude, :longitude, :holiday_type, :theme, :allowed_age_0_4, :allowed_age_5_7, :allowed_age_8_11, :allowed_age_12_15, :allowed_age_16_18, :duration, :price, :bucket_list_count, :average_review_score, :photos)
  end
end

