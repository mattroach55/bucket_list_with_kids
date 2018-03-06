class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @experience = Experience.find(params[:experience_id])
    @review.user = current_user
    @review.experience_id = @experience.id
    authorize @review

    if @review.save
      respond_to do |format|
        format.html { redirect_to experience_path(@review.experience) }
        format.js  { render :create }
      end
    else
      render 'experiences/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    authorize @review

    respond_to do |format|
      format.html { redirect_to experience_path(Experience.find(@review.experience_id)) }
      format.js { render :destroy }
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
