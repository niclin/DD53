class OfficialHolidayOption < ActiveRecord::Base
  has_many :official_holidays, dependent: :destroy
  has_many :menus, through: :official_holidays
end
