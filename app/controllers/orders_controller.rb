class OrdersController < ApplicationController
  def index
    @orders = Order.where(date: Date.today, status: true)
    @menus = Menu.all
  end
end
