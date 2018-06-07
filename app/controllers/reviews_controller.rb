class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if params[:experience_id]
      @experience = Experience.find_by_url_name(params[:experience_id])
      @review.experience_id = @experience.id
    else
      # accommodation
      @accommodation = Accommodation.find(params[:accommodation_id])
      @review.accommodation_id = @accommodation.id
    end

    @review.user = current_user
    authorize @review

    if @review.save
      respond_to do |format|
        format.html { redirect_to experience_path(@review.experience.destination, @review.experience) }
        format.js  { render (@review.experience_id ? :create_experience :  :create_accommodation) }
      end
    else
      render 'experiences/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    experience = @review.experience
 
    @review.destroy

    respond_to do |format|
      format.html { redirect_to experience_path(experience.destination, experience) }
      format.js { render :destroy }
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
