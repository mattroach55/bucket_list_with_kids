class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destinations = Destination.all
  end

  def show

  end

  def new
    @destinations = Destination.new
  end

  def create
    @destination = Destination.new(params_destination)
    @destination.save
    redirect_to destination_path(@destination)
  end

  def edit

  end

  def update
    @destination.update(destination_params)
    redirect_to destination_path(@destination)
  end

  # def destroy
  #   redirect to
  # end

private

def set_destination
  @destination = Destination.find(params[:id])
end

  def params_destination
    params.require(:destination).permit(:name, :description, :address)
  end
end


