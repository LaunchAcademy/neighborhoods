class VotesController < ApplicationController
  def create
    vote = Vote.find_or_create_by(
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
