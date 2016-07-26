class Admin::EventsController < ApplicationController
  require 'slack-notifier'
  layout "admin"

  def index
    @events = Event.order("id DESC").paginate(:page => params[:page], :per_page => 15)
    @menus = Menu.order("id DESC")
  end

  def show
    @event = Event.find(params[:id])
    @members = @event.members
    @orders = Order.where(event_id: @event)
  end

  def select
    @menus = Menu.all
  end

  def select_menu
    @menu = Menu.find(params[:menu_id])
    today = Date.today.wday

    @user = current_user.id
    @date = DateTime.now
    if request.post?
      if @menu.day_off?
        @event = Event.create(menu_id: @menu.id, user_id: @user, date: @date, menu_name: @menu.title)
        @event.status_open
        redirect_to :back, alert: "已開啟#{@menu.title}的訂餐，快通知大家吧！"
        if Rails.env.production?
          notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
          notifier.ping "<a href='http://dd53.xyz/'>由「#{current_user.name}」開啟了訂餐任務，今天吃「#{@menu.title}」吧，要記得點餐唷！</a> :heart:"
        end
      else
        flash[:warning] = "靠悲今天公休"
        redirect_to :back
      end
    end
  end

  def invoice
    @event = Event.find(params[:event_id])
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
