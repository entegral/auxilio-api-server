class AddDepartmentRefToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :department, foreign_key: true
  end
end
