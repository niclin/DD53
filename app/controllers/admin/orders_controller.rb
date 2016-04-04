class Admin::OrdersController < ApplicationController
  layout "admin"

  def index
    @menus = Menu.all
  end

  def order_select
    @menu = Menu.find(params[:menu_id])
    @user = current_user.id
    @date = DateTime.now
    if request.post?
      @order = Order.create(menu_id: params[:menu_id], user_id: @user, date: @date, menu_name: @menu.title)
      @order.status_open
      redirect_to :back, alert: "已開啟#{@menu.title}的訂餐，快通知大家吧！"
    end
  end
end