class OrderUser < ActiveRecord::Base
  belongs_to :order
  has_many :items, class_name: "OrderItem", dependent: :destroy
  has_one  :info,  class_name: "OrderInfo", dependent: :destroy
end
