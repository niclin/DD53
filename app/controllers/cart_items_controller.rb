class CartItemsController < ApplicationController

  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @item = @cart.find_cart_item(params[:id])
    @food = @item.food
    @item.destroy

    flash[:warning] = "成功將 #{@food.name} 從購物車刪除!"
    redirect_to :back
  end

  def update
    @cart = current_cart
    @item = @cart.cart_items.find_by(food_id: params[:id])

    @item.update(item_params)

    redirect_to :back
  end

  private

  def item_params
    params.require(:cart_item).permit(:quantity)
  end
end
