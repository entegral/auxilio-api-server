class AddTables < ActiveRecord::Migration[5.2]
  def change

    create_table :organizations do |t|
      t.column :uid, :string
      t.column :name, :string
      t.timestamps
    end

    create_table :departments do |t|
      t.column :uid, :string
      t.column :name, :string
      t.belongs_to :organization, index: true
      t.timestamps
    end

    create_table :jobs do |t|
      t.column :title, :string
      t.column :org_lead, :boolean
      t.column :dept_lead, :boolean
      t.belongs_to :department, index: true
      t.timestamps
    end

    create_table :users do |t|
      t.column :uid, :string
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :email, :string
      t.belongs_to :job, index: true
      t.timestamps
    end

    create_join_table :organizations, :users do |t|
      t.index :organization_id
      t.index :user_id
    end

  end
end
