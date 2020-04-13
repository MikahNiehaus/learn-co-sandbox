class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :text
      t.integer :topic_id
       t.integer :user_id
    end
  end
end