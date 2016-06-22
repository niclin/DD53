class EventMailer < ApplicationMailer
  def notify_event_completed(event)
    @orders = event.orders

    mail(to: 'nic@kt.net.tw' , subject: "[DD53] 訂購「#{event.menu_name}」餐點的團體明細")

  end
end
