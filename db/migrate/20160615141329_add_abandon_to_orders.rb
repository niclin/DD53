class AddAbandonToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_abandon, :boolean, default: false
  end
end
