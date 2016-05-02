class CreateOfficialHolidays < ActiveRecord::Migration
  def change
    create_table :official_holidays do |t|
      t.references :menu, index: true
      t.references :official_holiday_option, index: true, :null => false

      t.timestamps null: false
    end
  end
end
