class Admin::NeighborhoodsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @neighborhoods = Neighborhood.where(approved: false).order(created_at: :desc)
  end

  def update
    neighborhood = Neighborhood.find(params[:id])
    if params[:approved]
      neighborhood.approved = true
      if neighborhood.save
        flash[:notice] = 'Neighborhood has been approved'
      else
        flash[:alert] = 'Neighborhood could not be approved'
      end
      redirect_to admin_neighborhoods_path
    else
      flash[:alert] = 'Neighborhood was declined'
    end
  end


  def destroy
    neighborhood = Neighborhood.find(params[:id])
    neighborhood.destroy
    flash[:alert] = 'Neighborhood was rejected'
    redirect_to admin_neighborhoods_path
  end

  # def update
  #   @member = User.find(params[:id])
  #   @member.role = 'admin'
  #   @member.save
  #   if @member.role == 'admin'
  #     flash[:notice] = 'User has been promoted'
  #     redirect_to admin_users_path
  #   else
  #     flash.now[:notice] = 'Something went wrong.'
  #     render 'admin/users'
  #   end
  # end

  # def destroy
  #   @member = User.find(params[:id])
  #   if @member
  #     @member.destroy
  #     flash[:notice] = 'User has been deleted'
  #     redirect_to admin_users_path
  #   else
  #     flash.now[:notice] = 'Something went wrong.'
  #     render 'admin/users'
  #   end
  # end

  private
  def hood
    @neighborhood = Neighborhood.find(params[:id])
  end

  def authenticate_admin!
    unless current_user.role == 'admin'
      flash[:alert] = 'You are not authorized to view this page.'
      redirect_to root_url
    end
  end
end
