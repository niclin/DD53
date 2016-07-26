class AddDatenameToOfficialHolidayOptions < ActiveRecord::Migration
  def change
    add_column :official_holiday_options, :datename, :integer
  end
end
