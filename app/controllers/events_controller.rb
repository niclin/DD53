class EventsController < ApplicationController
  include FindTeam

  before_action :authenticate_user!
  before_action :find_this_team
  layout "team"

  def index
    @events = current_team.events(date: Date.today, status: true)
    @menus = current_team.menus
  end

  def ordering
    @event = Event.find(params[:id])
    @menu = Menu.find(@event.menu_id)
    session[:event_id] = @event.id
  end

  def join_event
    @event = Event.find(params[:id])
    @menu = Menu.find(@event.menu_id)

    if !current_user.is_member_of?(@event)
      current_user.join!(@event)
      flash[:notice] = "加入餐點成功！"
    else
      flash[:warning] = "你已經是本餐點成員了！"
    end
    redirect_to ordering_event_path(@event)
  end

  def add_to_cart
    @food = Food.find(params[:food_id])

    if !current_cart.cart_items.include?(@food)
      current_cart.add_food_to_cart(@food)
      flash[:notice] = "你已成功將 #{@food.name} 加入食物車"
    else
      flash[:warning] = "你的食物車內已有此物品"
    end
    respond_to do |format|
      format.js
    end

  end


  def add_multi_to_cart
    @food = Food.find(params[:food_id])
    @food_sub = FoodSub.find(params[:sub_id])

    if !current_cart.cart_items.include?(@food)
      current_cart.add_multi_food_to_cart(@food, @food_sub)
      flash[:notice] = "你已成功將 #{@food.name} 加入食物車"
    else
      flash[:warning] = "你的食物車內已有此物品"
    end
    respond_to do |format|
      format.js
    end
  end

  def reference
    @event = Event.find(params[:id])
    @members = @event.members
    @orders = Order.where(event_id: @event)
  end

  def to_abandon
    @event = Event.find(params[:id])
    @order = Order.new(event_id: @event.id, total: '0', user_id: current_user.id, is_abandon: true)
    @order.save
    redirect_to :root
  end

  def cancel_order
    @order = Order.find(params[:order_id])
    @event = Event.find(params[:event_id])
    @cancel = Order.find_by(id: @order , event_id: @event, user_id: current_user)
    @cancel.destroy
  end

end
