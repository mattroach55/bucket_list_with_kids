class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]

  def index
    policy_scope(Destination)
  end

  def show_redirect
    @destination = Destination.find(params[:id])
    redirect_to "/#{@destination.url_friendly_name}", status: :moved_permanently
  end

  def show_by_name
    @destination = Destination.where(url_name: params[:destination_name]).first
    if @destination.nil?
      raise ActionController::RoutingError.new('Not Found')
    else
      show
    end
  end

  def upvote
    @destination = Destination.find(params[:id])
    authorize @destination
    @destination.upvote_by(current_user)
    if current_user.bucket_list_items.where(destination: @destination).empty?
      @bucket = BucketListItem.new
      @bucket.user = current_user
      @bucket.destination = @destination
      @bucket.save
    end
    redirect_to destinations_path(anchor: "main-results")
  end

  # UPVOTE WORKS, NOW TESTING DOWNVOTE
  # def downvote
  #   @destination = Destination.find(params[:id])
  #   authorize @destination
  #   @destination.downvote_by(current_user)
  #   if current_user.bucket_list_items.where(destination: @destination).empty?
  #     @bucket = BucketListItem.new
  #     @bucket.user = current_user
  #     @bucket.destination = @destination
  #     @bucket.save
  #   end
  #   redirect_to destinations_path
  # end

  def mix
    #future code
  end

  def show
    @destinations = Destination.all
    @destination = Destination.find_by_url_name(params[:id])
    @accommodations = Accommodation.where(destination: @destination)
    @experiences = Experience.where(destination: @destination)

    authorize @destination
    @markers = [{ lat: @destination.latitude, lng: @destination.longitude }]

    render :show
  end

  def new
    @destination = Destination.new
    authorize @destination
  end

  def create
    @destination = Destination.new(params_destination)
    authorize @destination
    @destination.user = current_user
    if @destination.save
      # store_photos
      redirect_to destination_path(@destination)
    else
      render 'new'
    end
  end

  def edit
    authorize @destination
  end

  def update
    authorize @destination
    if @destination.update(params_destination)
      redirect_to destination_path(@destination)
    else
      render :new
    end
  end

  def destroy
    authorize @destination
    @destination.destroy
    redirect_to manage_destinations_path
  end

  private

  def store_photos
    photos = params[:destination][:photos]
    photos.each {|photo| @destination.photos.create(photo: photo)} if photos
  end

  def set_destination
    @destination = Destination.find_by_url_name(params[:id])
  end

  def params_destination
    params.require(:destination).permit(
      :name, :entity, :show, :description, :street_number, :street,
      :locality, :country, :region, :latitude, :longitude, :holiday_type,
      :theme, :allowed_age_0_4, :allowed_age_5_7, :allowed_age_8_11,
      :allowed_age_12_15, :allowed_age_16_18, :duration, :price,
      :bucket_list_count, :average_review_score, :meta_title,
      :meta_description, photos_attributes: [:photo]
    )
  end
end



