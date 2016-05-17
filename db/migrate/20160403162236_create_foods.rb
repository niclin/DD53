class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :menu_id
      t.string :name
      t.integer :price, default: 0

      t.timestamps null: false
    end
  end
end
