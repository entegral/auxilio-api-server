class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :first_year_enrolled, :integer
    remove_column :users, :first_year_worked, :integer
  end
end
