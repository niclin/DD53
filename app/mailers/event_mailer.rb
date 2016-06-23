class EventMailer < ApplicationMailer
  include Roadie::Rails::Automatic
  def notify_event_completed(event, user)
    @orders = event.orders
    mail(to: user.email , subject: "[DD53] 訂購「#{event.menu_name}」餐點的團體明細" )
  end
end
