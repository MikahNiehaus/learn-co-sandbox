class CreateTopicsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :text
        t.integer :user_id
    end
  end
end