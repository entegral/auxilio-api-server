class AddOrganizationAndJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.column :uid, :string
      t.column :name, :string
      t.timestamps
    end

    create_join_table :organizations, :users do |t|
      t.index :organization_id
      t.index :user_id
    end
  end
end
