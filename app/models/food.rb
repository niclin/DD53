class Food < ActiveRecord::Base
  belongs_to :menu
  has_many :food_subs
    accepts_nested_attributes_for :food_subs, :reject_if => :all_blank, :allow_destroy => true
end
