class NeighborhoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @neighborhoods = Neighborhood.all
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
  end

  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :description)
  end
end
