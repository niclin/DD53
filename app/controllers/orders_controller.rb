class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      @order.event_id = session[:event_id]
      @order.build_item_cache_from_cart(current_cart)
      @order.calculate_total!(current_cart)
      current_cart.clean!
      session.delete(:event_id)
      redirect_to order_path(@order)
    else
      render "carts/checkout"
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_info = @order.info
    @order_items = @order.items
    @event = @order.event
  end

  private

  def order_params
    params.require(:order).permit(info_attributes: [:user_name,
                                                    :note, :is_notify] )
  end
end
