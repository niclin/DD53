class CreateOfficialHolidayOptions < ActiveRecord::Migration
  def change
    create_table :official_holiday_options do |t|
      t.string :name, :null => false

      t.timestamps null: false
    end
  end
end
