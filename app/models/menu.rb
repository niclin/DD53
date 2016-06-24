class Menu < ActiveRecord::Base
  has_one :photo
  has_many :foods
  has_many :official_holidays, dependent: :destroy
  has_many :official_holiday_options, through: :official_holidays

  extend FriendlyId
  friendly_id :title, use: :slugged

  accepts_nested_attributes_for :photo
  accepts_nested_attributes_for :foods,
    reject_if: proc { |attributes| attributes['name'].blank? },
    allow_destroy: true

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def slug_candidates
    [
      :title,
      [:title, :phone]
    ]
  end
end
