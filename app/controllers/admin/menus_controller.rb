class Admin::MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to admin_menus_path
    else
      render :new
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :phone, :address, :delivery)
  end
end
