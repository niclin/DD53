class EventMailer < ApplicationMailer
  def notify_event_completed(event)
    @orders = event.orders
    @members = event.members

    @members.each do |member|
      mail(to: member.email , subject: "[DD53] 訂購「#{event.menu_name}」餐點的團體明細")
    end
  end
end
