class Cart < ActiveRecord::Base
  has_many :events
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items, source: :food

  def add_food_to_cart(food)
    ci = cart_items.build
    ci.food = food
    ci.save
  end

  def total_price
    sum = 0

    cart_items.each do |cart_item|
      sum = sum + (cart_item.food.price * cart_item.quantity)
    end

    sum
  end

  def clean!
    cart_items.destroy_all
  end

  def find_cart_item(food)
    cart_items.find_by(food_id: food)
  end

end
