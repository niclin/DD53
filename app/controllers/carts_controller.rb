class CartsController < ApplicationController

  before_action :authenticate_user!, only: [:checkout]

  def checkout
    @event = session[:event_id]
    @order = current_user.orders.build
    @info = @order.build_info
  end

  def clean
    current_cart.clean!
    flash[:warning] = "已清空購物車"
    redirect_to :back
  end
end
