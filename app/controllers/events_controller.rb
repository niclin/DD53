class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.where(date: Date.today, status: true)
    @menus = Menu.all
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

    redirect_to :back
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

    redirect_to :back
  end
end
