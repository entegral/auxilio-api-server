class AddUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.column :uid, :string
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :email, :string
      t.column :first_year_enrolled, :integer
      t.column :first_year_worked, :integer
    end
  end
end
