class CreateTopicsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :text
    end
  end
end