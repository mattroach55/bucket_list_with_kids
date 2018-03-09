class ExperiencesController < ApplicationController
  before_action :set_destination, only: [:new, :create]
  before_action :set_experience, only: [:show, :edit, :update, :photo, :destroy]
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
  def show
    authorize @experience
    # MAP CODE BELOW
    # @markers = [{ lat: @experience.latitude, lng: @experience.longitude, infoWindow: { content: @experience.name }}]
    @markers = [{ lat: @experience.latitude, lng: @experience.longitude, infoWindow: { content: render_to_string(partial: "shared/marker_window", locals: { selection: @experience }) } }]

    # MAP CODE ABOVE
    @review = Review.new
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
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def photo

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

  def set_destination
    @destination = Destination.find(params[:destination_id])
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def params_experience
    params.require(:experience).permit(:name, :description, :street_number, :street, :locality, :country, :region, :latitude, :longitude, :photo, :duration, :bucket_list_count, :average_review_score, :entity)
  end
end

