class CreateFoodSubs < ActiveRecord::Migration
  def change
    create_table :food_subs do |t|
      t.integer :food_id
      t.string :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
