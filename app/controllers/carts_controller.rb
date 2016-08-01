class CartsController < ApplicationController

  before_action :authenticate_user!, only: [:checkout]
  layout "team", only: [:checkout]

  def checkout
    @event = session[:event_id]
    @order = current_user.orders.build
    @info = @order.build_info
  end

  def clean
    current_cart.clean!
    flash[:warning] = "已清空食物車"
    respond_to do |format|
      format.js
    end
  end
end
