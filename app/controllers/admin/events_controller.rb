class Admin::EventsController < ApplicationController
  layout "admin"

  def index
    @events = Event.where(date: Date.today, status: true)
    @menus = Menu.all
  end

  def show
    @event = Event.find(params[:id])
    @members = @event.members
    @orders = Order.where(event_id: @event)
  end

  def select
    @menus = Menu.all
  end

  def select_menu
    @menu = Menu.find(params[:menu_id])
    @user = current_user.id
    @date = DateTime.now
    if request.post?
      @event = Event.create(menu_id: params[:menu_id], user_id: @user, date: @date, menu_name: @menu.title)
      @event.status_open
      redirect_to :back, alert: "已開啟#{@menu.title}的訂餐，快通知大家吧！"
    end
  end
end
