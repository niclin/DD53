class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.string :phone
      t.string :address
      t.boolean :delivery

      t.timestamps null: false
    end
  end
end
