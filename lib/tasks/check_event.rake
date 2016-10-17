namespace :events do
    desc "Events check status"
    task inactivatethem: :environment do
        Event.are_ready_to_inactive.find_each do |ofert|
          ofert.update_attributes status: false
        end
    end
 end
