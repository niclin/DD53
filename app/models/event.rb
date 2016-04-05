class Event < ActiveRecord::Base

  belongs_to :user

  has_many :event_users
  has_many :members, through: :event_users, source: :user
  has_many :orders

  def status_open
    self.update_columns(status: true)
  end

  def status_close
    self.update_columns(status: false)
  end

  def check_order(user, event)
    result = "true"
    order = Order.find_by(user_id: user.id, event_id: event.id)
    if order.blank?
      result = "false"
    end
  end

  def total_order_price(event)
    orders = event.orders
    sum = 0
    orders.each do |order|
      sum = sum + order.total
    end
    sum
  end
end
