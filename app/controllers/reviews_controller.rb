class ReviewsController < ApplicationController
  def new
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.neighborhood_id = params[:neighborhood_id]
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = 'Successfully added.'
      redirect_to neighborhood_path(@review.neighborhood)
    else
      flash[:alert] = 'Could not save.'
      redirect_to neighborhood_path(params[:neighborhood_id])
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
