class AddPlaceIdColumnToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :restaurant_1_place_id, :string
    add_column :polls, :restaurant_2_place_id, :string
    add_column :polls, :restaurant_3_place_id, :string
  end
end
