class AddDepartmentTable < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.column :uid, :string
      t.column :name, :string
      t.belongs_to :organization, index: true
      t.timestamps
    end
  end
end
