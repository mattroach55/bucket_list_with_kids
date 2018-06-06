# authentication
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]
  def home
    destinations = Destination.where.not(latitude: nil, longitude: nil)
    accommodations = Accommodation.where.not(latitude: nil, longitude: nil)
    experiences = Experience.where.not(latitude: nil, longitude: nil)
    all_entities = destinations + experiences + accommodations

    @show_entities = Kaminari.paginate_array(filter_entities(all_entities)).page(params[:page]).per(12)
    @markers = make_markers(@show_entities)
  end

  def search
    all_entities = []
    if params[:query].present?
      PgSearch::Multisearch.rebuild(Experience)
      PgSearch::Multisearch.rebuild(Accommodation)
      PgSearch::Multisearch.rebuild(Destination)

      results = PgSearch.multisearch(params[:query])

      results.each do |result|
        all_entities << result.searchable
      end
    else
      destinations = Destination.where.not(latitude: nil, longitude: nil)
      accommodations = Accommodation.where.not(latitude: nil, longitude: nil)
      experiences = Experience.where.not(latitude: nil, longitude: nil)
      all_entities = destinations + experiences + accommodations
    end

    @show_entities = Kaminari.paginate_array(filter_entities(all_entities)).page(params[:page]).per(12)
    @markers = make_markers(@show_entities)
  end

  private
  def make_markers(entities)
    # CODE TO ADD MAP TO HOME INDEX PAGE WITH MARKERS FOR ALL 3 ENTITIES.Markers have name, photo and link
    entities.map do |e|
      {
        lat: e.latitude,
        lng: e.longitude,
        # infoWindow: { content: entity.name }
        infoWindow: { content: render_to_string(partial: "shared/marker_window", locals: { selection: e }) }
      }
    end
  end

  def filter_entities(entities)
    @filtered_entities = []
    #ENTITY FILTERS
    [:accommodation, :experience, :destination].each do |filter|
      if params[filter].present?
        @filtered_entities += entities.select { |entity| entity.entity == filter.to_s }
      end
    end
    # THEME FILTERS
    [:adventure, :art, :automobiles, :body, :entertainment, :food, :science, :shopping].each do |filter|
      if params[filter].present?
        @filtered_entities += entities.select { |entity| entity.theme == filter.to_s }
      end
    end
    # HOLIDAY TYPE FILTERS
    [:beach, :city, :cruise, :outdoors, :snow].each do |filter|
      if params[filter].present?
        @filtered_entities += entities.select { |entity| entity.holiday_type == filter.to_s }
      end
    end
    # REGION FILTERS
    [:asia, :australia, :europe, :middle, :north, :south, :africa].each do |filter|
      if params[filter].present?
        @filtered_entities += entities.select { |entity| entity.region == filter.to_s }
      end
    end
    # AGE FILTERS
    if params[:age_0_4].present?
      @filtered_entities += entities.select { |entity| entity.allowed_age_0_4 == true }
    end
    if params[:age_5_7].present?
      @filtered_entities += entities.select { |entity| entity.allowed_age_0_4 == true }
    end
    if params[:age_8_11].present?
      @filtered_entities += entities.select { |entity| entity.allowed_age_0_4 == true }
    end
    if params[:age_12_15].present?
      @filtered_entities += entities.select { |entity| entity.allowed_age_0_4 == true }
    end
    if params[:age_16_18].present?
      @filtered_entities += entities.select { |entity| entity.allowed_age_0_4 == true }
    end


    @filtered_entities = entities if @filtered_entities.empty?

    @filtered_entities = @filtered_entities.keep_if { |entity| entity.show == true }
    # @filtered_entities = @filtered_entities.shuffle
    @filtered_entities
  end
end
