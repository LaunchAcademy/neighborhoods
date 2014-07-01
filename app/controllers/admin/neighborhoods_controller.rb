class Admin::NeighborhoodsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @neighborhoods = Neighborhood.where(approved: false).
    order(created_at: :desc)
  end

  def update
    @neighborhood = Neighborhood.find(params[:id])
    if params[:approved]
      @neighborhood.approved = true
      if @neighborhood.save
        flash[:notice] = "Neighborhood has been approved"
        NeighborhoodMailer.neighborhood_approved_email(@neighborhood).deliver
      else
        flash[:alert] = "Neighborhood could not be approved"
      end
    else
      flash[:alert] = "Neighborhood was declined"
    end
    redirect_to admin_neighborhoods_path
  end

  def destroy
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood.destroy
    flash[:alert] = "Neighborhood was rejected"
    redirect_to admin_neighborhoods_path
    NeighborhoodMailer.neighborhood_declined_email(@neighborhood).deliver
  end

  private
  def hood
    @neighborhood = Neighborhood.find(params[:id])
  end

  def authenticate_admin!
    unless current_user.role == "admin"
      flash[:alert] = "You are not authorized to view this page."
      redirect_to root_url
    end
  end
end
