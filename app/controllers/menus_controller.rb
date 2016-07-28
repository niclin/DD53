class MenusController < ApplicationController
  include FindTeam
  layout "teams"

  before_action :authenticate_user!
  before_action :find_this_team


  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end
end
