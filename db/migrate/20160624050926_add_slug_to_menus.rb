class AddSlugToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :slug, :string
    add_index :menus, :slug, unique: true
  end
end
