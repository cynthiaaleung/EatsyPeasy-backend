class RecreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :restaurant_1_name
      t.string :restaurant_2_name
      t.string :restaurant_3_name
      t.integer :restaurant_1_votes
      t.integer :restaurant_2_votes
      t.integer :restaurant_3_votes
      t.string :restaurant_1_business_hours
      t.string :restaurant_2_business_hours
      t.string :restaurant_3_business_hours
      t.string :restaurant_1_phone_number
      t.string :restaurant_2_phone_number
      t.string :restaurant_3_phone_number
      t.string :restaurant_1_website
      t.string :restaurant_2_website
      t.string :restaurant_3_website
      t.string :restaurant_1_maps_directions
      t.string :restaurant_2_maps_directions
      t.string :restaurant_3_maps_directions
      t.string :alpha_numeric_id
      t.timestamps null: false
    end
  end
end
