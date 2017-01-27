class Admin::EventsController < ApplicationController
  require 'slack-notifier'

  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"

  def index
    @events = current_team.events.order("id DESC").paginate(:page => params[:page], :per_page => 15)
    @menus = Menu.order("id DESC")
  end

  def show
    @event = current_team.events.find(params[:id])
    @members = @event.members
    @orders = Order.where(event_id: @event)
  end

  def select
    @public_menus = Menu.where(is_public: true)
    @team_menus = current_team.menus
  end

  def select_menu
    @menu = Menu.find(params[:menu_id])
    today = Date.today.wday

    @user = current_user.id
    @date = DateTime.now
    if request.post? && !@menu.day_off?
      @event = Event.create(menu_id: @menu.id, user_id: @user, date: @date, menu_name: @menu.title, team_id: current_team.id, due_date: Time.zone.now + 120.minutes)
      @event.status_open
      redirect_to :back, alert: "已開啟#{@menu.title}的訂餐，快通知大家吧！"
    else
      flash[:warning] = "靠悲今天公休"
      redirect_to :back
    end
  end

  def invoice
    @event = current_team.events.find(params[:event_id])
    @event.event_invoice

    @event.orders.each do |order|
      if !order.is_abandon?
        if order.info.is_notify?
          EventMailer.delay.notify_event_completed(@event, order.user)
        end
      end
    end

    redirect_to admin_events_path
  end
end
