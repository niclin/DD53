class CartItemsController < ApplicationController

  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @item = CartItem.find(params[:id])

    @item.destroy

    flash[:warning] = "成功將 #{@item.name} 從購物車刪除!"
    respond_to do |format|
      format.js
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity])
    respond_to do |format|
      format.js
    end
  end

  private

  def item_params
    params.require(:cart_item).permit(:quantity)
  end
end
