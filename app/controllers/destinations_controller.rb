class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]


  # SHORT_NAMES: {
  #   adventure: 'adventure and sport'
  # }

  def index
    policy_scope(Destination)

    # CODE TO IMPLEMENT SEARCH RESULTS BELOW
    if params[:query].present?
      PgSearch::Multisearch.rebuild(Experience)
      PgSearch::Multisearch.rebuild(Accommodation)
      PgSearch::Multisearch.rebuild(Destination)

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

    #ENTITY FILTERS
    if params[:destination].present?
      @all_entities = @all_entities.keep_if { |entity| entity.entity == 'destination' }
    end
        if params[:experience].present?
      @all_entities = @all_entities.keep_if { |entity| entity.entity == 'experience' }
    end
    if params[:accommodation].present?
      @all_entities = @all_entities.keep_if { |entity| entity.entity == 'accommodation' }
    end
    # THEME FILTERS
    if params[:adventure].present?
      @all_entities = @all_entities.keep_if { |entity| entity.theme == 'adventure' }
    end
    if params[:art].present?
      @all_entities = @all_entities.keep_if { |entity| entity.theme == 'art' }
    end
    if params[:automobiles].present?
      @all_entities = @all_entities.keep_if { |entity| entity.theme == 'automobiles' }
    end
    if params[:body].present?
      @all_entities = @all_entities.keep_if { |entity| entity.theme == 'body' }
    end
    if params[:entertainment].present?
      @all_entities = @all_entities.keep_if { |entity| entity.theme == 'entertainment' }
    end
    if params[:food].present?
      @all_entities = @all_entities.keep_if { |entity| entity.theme == 'food' }
    end
    if params[:science].present?
      @all_entities = @all_entities.keep_if { |entity| entity.theme == 'science' }
    end
    if params[:shopping].present?
      @all_entities = @all_entities.keep_if { |entity| entity.theme == 'shopping' }
    end
    # HOLIDAY TYPE FILTERS
    if params[:beach].present?
      @all_entities = @all_entities.keep_if { |entity| entity.holiday_type == 'beach' }
    end
    if params[:city].present?
      @all_entities = @all_entities.keep_if { |entity| entity.holiday_type == 'city' }
    end
    if params[:cruise].present?
      @all_entities = @all_entities.keep_if { |entity| entity.holiday_type == 'cruise' }
    end
    if params[:outdoors].present?
      @all_entities = @all_entities.keep_if { |entity| entity.holiday_type == 'outdoors' }
    end
    if params[:snow].present?
      @all_entities = @all_entities.keep_if { |entity| entity.holiday_type == 'snow' }
    end
    # REGION FILTERS
    if params[:asia].present?
      @all_entities = @all_entities.keep_if { |entity| entity.region == 'Asia' }
    end
    if params[:australia].present?
      @all_entities = @all_entities.keep_if { |entity| entity.region == 'Australia and South Pacific' }
    end
    if params[:europe].present?
      @all_entities = @all_entities.keep_if { |entity| entity.region == 'Europe' }
    end
    if params[:middle].present?
      @all_entities = @all_entities.keep_if { |entity| entity.region == 'Middle East and North Africa' }
    end
    if params[:north].present?
      @all_entities = @all_entities.keep_if { |entity| entity.region == 'North America' }
    end
    if params[:south].present?
      @all_entities = @all_entities.keep_if { |entity| entity.region == 'South America' }
    end
    if params[:africa].present?
      @all_entities = @all_entities.keep_if { |entity| entity.region == 'Africa (Sub-Saharan)' }
    end
    # AGE FILTERS
    if params[:age_0_4].present?
      @all_entities = @all_entities.keep_if { |entity| entity.age_allowed_0_4 == true }
    end
    if params[:age_5_7].present?
      @all_entities = @all_entities.keep_if { |entity| entity.age_allowed_5_7 == true }
    end
    if params[:age_8_11].present?
      @all_entities = @all_entities.keep_if { |entity| entity.age_allowed_8_11 == true }
    end
    if params[:age_12_15].present?
      @all_entities = @all_entities.keep_if { |entity| entity.age_allowed_12_15 == true }
    end
    if params[:age_16_18].present?
      @all_entities = @all_entities.keep_if { |entity| entity.age_allowed_16_18 == true }
    end

    @all_entities = @all_entities.keep_if { |entity| entity.show == true }
    @show_entities = @all_entities.shuffle


    # CODE TO ADD MAP TO HOME INDEX PAGE WITH MARKERS FOR ALL 3 ENTITIES.Markers have name, photo and link
    @markers = @show_entities.map do |e|
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


# GABY FILTER CODE
#     @filtered_entities = []
#     SHORT_NAMES.each do |short_name, actual_name|
#       if params[short_name].present?
#         @filtered_entities << entity if entity.theme == actual_name
#       end
#     end



