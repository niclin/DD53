class MenusController < ApplicationController

  include FindTeam
    before_action :find_this_team
  layout "teams"

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end
end
