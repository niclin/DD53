class Food < ActiveRecord::Base
  belongs_to :menu
  has_many :food_subs
end
