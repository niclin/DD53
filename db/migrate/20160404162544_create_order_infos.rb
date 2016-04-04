class CreateOrderInfos < ActiveRecord::Migration
  def change
    create_table :order_infos do |t|
      t.integer :order_id
      t.string :user_name
      t.text :note

      t.timestamps null: false
    end
  end
end
