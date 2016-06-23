class AddIsNotifyToOrderInfo < ActiveRecord::Migration
  def change
    add_column :order_infos, :is_notify, :boolean, default: false
  end
end
