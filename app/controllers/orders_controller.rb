class OrdersController < ApplicationController
  def index
    @orders = Order.where(date: Date.today, status: true)
    @menus = Menu.all
  end

  def checkout
    @order = Order.find(params[:order_id])
    @menu = Menu.find(@order.menu_id)
    @order_items = OrderInfo.where(user_id: current_user.id, order_id: @order)
  end

  def join_order
    @order = Order.find(params[:id])
    @menu = Menu.find(@order.menu_id)

    if !current_user.is_member_of?(@order)
      current_user.join!(@order)
      flash[:notice] = "加入本討論版成功！"
    else
      flash[:warning] = "你已經是本討論版成員了！"
    end

    redirect_to order_checkout_path(@order)
  end

end
