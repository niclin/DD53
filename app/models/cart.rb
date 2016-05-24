class Cart < ActiveRecord::Base
  has_many :events
  has_many :cart_items, dependent: :destroy

  def add_food_to_cart(food)
    f = Food.find(food.id)
    ci = cart_items.build
    ci.name = food.name
    ci.price = food.price
    ci.save
  end

  def add_multi_food_to_cart(food,sub)
    ci = cart_items.build
    ci.name = food.name + sub.description
    ci.price = sub.price
    ci.save
  end


  def total_price
    sum = 0

    cart_items.each do |cart_item|
      sum = sum + (cart_item.price * cart_item.quantity)
    end

    sum


  end

  def clean!
    cart_items.destroy_all
  end

  def find_cart_item(food)
    cart_items.find_by(name: food)
  end

end
