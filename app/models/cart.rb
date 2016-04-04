class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items, source: :food

  def add_food_to_cart(food)
    ci = cart_items.build
    ci.food = food
    ci.save
  end

  def total_price
    sum = 0

    items.each do |item|
      sum = sum + item.price
    end

    sum
  end
end
