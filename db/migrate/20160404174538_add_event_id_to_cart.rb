class AddEventIdToCart < ActiveRecord::Migration
  def change
    add_column :carts, :event_id, :integer
  end
end
