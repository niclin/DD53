class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :menu_id
      t.string :menu_name
      t.boolean :status
      t.integer :total, default: 0
      t.date :date

      t.timestamps null: false
    end
  end
end
