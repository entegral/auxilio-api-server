class AddOrgPosts < ActiveRecord::Migration[5.2]
  def change
    
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :uid
      t.string :category
 
      t.timestamps
    end

  end
end
