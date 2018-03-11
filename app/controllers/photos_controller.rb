class PhotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = photo.new
    if params[:experience_id]
      @experience = Experience.find(params[:experience_id])
      @photo.experience_id = @experience.id
    elsif
      # accommodation
      @accommodation = Accommodation.find(params[:accommodation_id])
      @photo.accommodation_id = @accommodation.id
    else
      #destination
      @destination = Destination.find(params[:destination_id])
      @photo.destination_id = @destination.id
    end
      @photo.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
