class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :photo]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    policy_scope(Experience)

    if params[:query].present?
      @experiences = Experience.search_by_name_description(params[:query])
    else
      @experiences = Experience.all
    end

    @experiences = @experiences.where.not(latitude: nil, longitude: nil)


    @markers = @experiences.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude,
        infoWindow: { content: experience.name }
      }
    end
  end

  def show
    @experience = Experience.find(params[:id])
    authorize @experience
    @markers = [{ lat: @experience.latitude, lng: @experience.longitude }]
    @review = Review.new
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(params_experience)
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
    @experience = Experience.find(params[:id])
    authorize @experience
    @experience.destroy
    redirect_to experiences_path
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def params_experience
    params.require(:experience).permit(:name, :description, :address, :latitude, :longitude, :photo, :duration, :bucket_list_count, :average_review_score, :type)
  end
end

