class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :menu
  belongs_to :team

  has_many :event_users
  has_many :members, through: :event_users, source: :user
  has_many :orders

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def slug_candidates
    [
      [:menu_name, :date]
    ]
  end

  def total_food_and_quantity
    foods = []
    self.orders.each do |order|
      order.items.each do |item|
        item.quantity.times do |n|
          foods << item.food_name
        end
      end
    end
    food_hash = foods.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
    result = food_hash.to_a
  end

  def status_open
    self.update_columns(status: true)
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
    self.update_columns(total: sum)
    sum
  end

  def event_invoice
    self.update_columns(status: false)
  end
end
