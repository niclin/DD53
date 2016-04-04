class EventUser < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  belongs_to :event
end
