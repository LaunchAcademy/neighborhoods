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
      NeighborhoodMailer.welcome_email(@neighborhood).deliver
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

  def approve_neighborhood(neighborhood)
    user = neighborhood.user
    neighborhood.approved = true
    if neighborhood.save
      user = neighborhood.user
      NeighborhoodMailer.neighborhood_approved_email(neighborhood, user).deliver
    end
  end


  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name, :description)
  end
end
