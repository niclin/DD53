class AddIntroductionToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :introduction, :text
  end
end
