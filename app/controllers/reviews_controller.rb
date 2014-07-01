class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @review = Review.new
  end

  def create
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @review = @neighborhood.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = 'Successfully added.'
      NeighborhoodMailer.neighborhood_review_email(@neighborhood).deliver
      redirect_to neighborhood_path(@review.neighborhood)
    else
      flash[:alert] = 'Could not save.'
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
