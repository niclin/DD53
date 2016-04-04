class CreateOrderUsers < ActiveRecord::Migration
  def change
    create_table :order_users do |t|
      t.integer :order_id
      t.integer :user_id
      t.integer :total

      t.timestamps null: false
    end
  end
end
