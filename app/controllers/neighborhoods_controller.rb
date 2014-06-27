class NeighborhoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = current_user.neighborhoods.build(neighborhood_params)

    if @neighborhood.save
      flash[:notice] = "Success! Your neighborhood is pending approval."
      redirect_to neighborhood_path(@neighborhood)
    else
      flash[:alert] = "Could not save."
      render :new
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    if current_user
      @upvoted = upvoted(current_user, @neighborhood.reviews)
      @downvoted = downvoted(current_user, @neighborhood.reviews)
    else
      flash[:alert] = 'Please sign in to vote on reviews.'
    end
  end

  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :description)
  end

  def upvoted(user, reviews)
    upvoted_reviews = []
    user.votes.each do |vote|
      if vote.weight == 1
        upvoted_reviews << vote.review
      end
    end
    upvoted_reviews
  end

  def downvoted(user, reviews)
    downvoted_reviews = []
    user.votes.each do |vote|
      if vote.weight == -1
        downvoted_reviews << vote.review
      end
    end
    downvoted_reviews
  end
end
