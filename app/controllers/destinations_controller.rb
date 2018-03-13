class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]


  def index
    policy_scope(Destination)

    # CODE TO IMPLEMENT SEARCH RESULTS BELOW
    if params[:query].present?
      PgSearch::Multisearch.rebuild(Destination)
      PgSearch::Multisearch.rebuild(Experience)
      PgSearch::Multisearch.rebuild(Accommodation)
      results = PgSearch.multisearch(params[:query])

      @all_entities = []
      results.each do |result|
        @all_entities << result.searchable
      end

    else
      @destinations = Destination.where.not(latitude: nil, longitude: nil)
      @accommodations = Accommodation.where.not(latitude: nil, longitude: nil)
      @experiences = Experience.where.not(latitude: nil, longitude: nil)
      @all_entities = @destinations + @experiences + @accommodations
    end
    # CODE TO IMPLEMENT PS SEARCH RESULTS ABOVE

    @show_entities = []
    @all_entities.each do |entity|
      if entity.show == true
        @show_entities << entity
      end
    end

    @shuffled_entities = @show_entities.shuffle

    # CODE TO ADD MAP TO HOME INDEX PAGE WITH MARKERS FOR ALL 3 ENTITIES.Markers have name, photo and link
    @markers = @all_entities.map do |e|
      {
        lat: e.latitude,
        lng: e.longitude,
        # infoWindow: { content: entity.name }
        infoWindow: { content: render_to_string(partial: "shared/marker_window", locals: { selection: e }) }
      }
    end
    # CODE TO ADD MAP TO HOME INDEX PAGE WITH MARKERS FOR ALL 3 ENTITIES ABOVE
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
    redirect_to destinations_path
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
    experiences = @destination.experiences
    authorize @destination
    @markers = [{ lat: @destination.latitude, lng: @destination.longitude }]
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
      store_photos
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
    redirect_to experiences_path
  end

  private
  def store_photos
    photos = params[:destination][:photos]
    photos.each {|photo| @destination.photos.create(photo: photo)} if photos
  end

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def params_destination
    params.require(:destination).permit(:name, :entity, :show, :description, :street_number, :street, :locality, :country, :region, :latitude, :longitude, :holiday_type, :theme, :allowed_age_0_4, :allowed_age_5_7, :allowed_age_8_11, :allowed_age_12_15, :allowed_age_16_18, :duration, :price, :bucket_list_count, :average_review_score, :photos)
  end
end



