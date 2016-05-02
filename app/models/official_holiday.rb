class OfficialHoliday < ActiveRecord::Base
  belongs_to :menu
  belongs_to :official_holiday_option
end
