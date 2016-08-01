class Account::OrdersController < ApplicationController
  layout "team"
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end
end
