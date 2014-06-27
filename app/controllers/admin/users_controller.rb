class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = User.where(role: :member)
    @admins = User.where(role: :admin)
  end

  def update
    @member = User.find(params[:id])
    @member.role = 'admin'
    @member.save
    if @member.role == 'admin'
      flash[:notice] = 'User has been promoted'
      redirect_to admin_users_path
    else
      flash.now[:notice] = 'Something went wrong.'
      render 'admin/users'
    end
  end

  def destroy
    @member = User.find(params[:id])
    if @member
      @member.destroy
      flash[:notice] = 'User has been deleted'
      redirect_to admin_users_path
    else
      flash.now[:notice] = 'Something went wrong.'
      render 'admin/users'
    end
  end

  private

  def authenticate_admin!
    unless current_user.role == 'admin'
      flash[:alert] = 'You are not authorized to view this page.'
      redirect_to root_url
    end
  end
end
