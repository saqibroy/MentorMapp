class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :number_of_views, default: 0
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
