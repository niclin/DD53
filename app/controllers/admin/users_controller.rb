class Admin::UsersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @users = current_team.users
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
      User.invite!({:email => params[:email]}, current_user) do |user|
        user.team = host
      end
    end
  end
end
