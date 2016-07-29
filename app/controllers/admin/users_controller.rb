class Admin::UsersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @users = User.all
  end

  def to_admin
    @user = User.find(params[:id])
    @user.to_admin

    redirect_to admin_users_path
  end

  def to_normal
    @user = User.find(params[:id])
    @user.to_normal

    redirect_to admin_users_path
  end

  def invite
    if params.has_key?(:email)
      host = request.host.split('.').first
      binding.pry
      User.invite!(:email => params[:email])
    end
  end
end
