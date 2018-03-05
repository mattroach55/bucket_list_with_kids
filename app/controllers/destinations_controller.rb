class DestinationsController < ApplicationController
  def index
    @destinations = Destination.New
  end

  def show
    @destination.find(params[:id])
    redirect_
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

end
