class AddDuedateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :due_date, :datetime
  end
end
