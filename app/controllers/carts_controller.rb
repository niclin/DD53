class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "已清空購物車"
    redirect_to :back
  end
end
