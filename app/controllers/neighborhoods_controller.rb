class NeighborhoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def search
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = current_user.neighborhoods.build(neighborhood_params)

    if @neighborhood.save
      NeighborhoodMailer.new_neighborhood_email(@neighborhood).deliver
      flash[:notice] = "Success! Your neighborhood is pending approval."
      redirect_to neighborhood_path(@neighborhood)
    else
      flash[:alert] = "Could not save."
      render :new
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    if !current_user
      flash[:alert] = 'Please sign in to vote on reviews.'
    end
  end

  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :description)
  end
end
