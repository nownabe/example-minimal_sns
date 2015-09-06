class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.text :text

      t.timestamps null: false
    end
  end
end
