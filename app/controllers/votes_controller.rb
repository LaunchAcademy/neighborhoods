class VotesController < ApplicationController
  def create
    vote = Vote.create(
      user: current_user, review_id: params[:review_id])
    vote.weight = params[:weight]
    if vote.save
      flash[:notice] = 'Success! Your vote has been counted.'
    else
      flash[:alert] = 'Could not save your vote.'
    end
    redirect_to neighborhood_path(vote.review.neighborhood)
  end

  def update
    vote = Vote.find_by(
      user: current_user, review_id: params[:review_id])
    vote.weight = params[:weight]
    if vote.save
      flash[:notice] = 'Success! Your vote has been counted.'
    else
      flash[:alert] = 'Could not save your vote.'
    end
    redirect_to neighborhood_path(vote.review.neighborhood)
  end
end
