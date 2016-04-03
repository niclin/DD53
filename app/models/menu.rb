class Menu < ActiveRecord::Base
  has_one :photo
  has_many :foods

  accepts_nested_attributes_for :photo
  accepts_nested_attributes_for :foods,
    reject_if: proc { |attributes| attributes['name'].blank? },
    allow_destroy: true
end
