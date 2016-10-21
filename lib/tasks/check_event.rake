namespace :events do
  desc "Events check status"
  task inactivatethem: :environment do
    Event.are_ready_to_inactive.find_each do |event|
      event.update_attributes status: false

      event.orders.each do |order|
        if !order.is_abandon?
          if order.info.is_notify?
            EventMailer.delay.notify_event_completed(event, order.user)
          end
        end
      end
    end
  end
end
