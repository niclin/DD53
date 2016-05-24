class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
