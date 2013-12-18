class CreatePosts < ActiveRecord::Migration
  def change
    drop_table :posts
    create_table :posts do |t|
      t.string :poster
      t.integer :problem
      t.text :text

      t.timestamps
    end
  end
end
