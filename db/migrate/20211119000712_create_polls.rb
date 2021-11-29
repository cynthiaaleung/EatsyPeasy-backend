class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :restaurant_name_1
      t.string :restaurant_name_2
      t.string :restaurant_name_3
      t.integer :votes_choice_1
      t.integer :votes_choice_2
      t.integer :votes_choice_3

      t.timestamps null: false
    end
  end
end
