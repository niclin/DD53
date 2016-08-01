class AddTeamIdToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :team_id, :integer
    add_column :menus, :is_public, :boolean, default: false
    add_column :menus, :user_id, :integer
    add_column :events, :team_id, :integer
  end
end
