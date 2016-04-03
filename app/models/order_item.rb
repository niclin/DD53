class OrderItem < ActiveRecord::Base
  balongs_to :order_user
end
