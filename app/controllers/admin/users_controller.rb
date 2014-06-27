class Admin::UsersController < ApplicationController
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
end
