# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20211124190855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "polls", force: :cascade do |t|
    t.string   "restaurant_1_name"
    t.string   "restaurant_2_name"
    t.string   "restaurant_3_name"
    t.integer  "restaurant_1_votes"
    t.integer  "restaurant_2_votes"
    t.integer  "restaurant_3_votes"
    t.string   "restaurant_1_business_hours"
    t.string   "restaurant_2_business_hours"
    t.string   "restaurant_3_business_hours"
    t.string   "restaurant_1_phone_number"
    t.string   "restaurant_2_phone_number"
    t.string   "restaurant_3_phone_number"
    t.string   "restaurant_1_website"
    t.string   "restaurant_2_website"
    t.string   "restaurant_3_website"
    t.string   "restaurant_1_maps_directions"
    t.string   "restaurant_2_maps_directions"
    t.string   "restaurant_3_maps_directions"
    t.string   "alpha_numeric_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "restaurant_1_place_id"
    t.string   "restaurant_2_place_id"
    t.string   "restaurant_3_place_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "poll_id"
    t.string   "restaurant_choice"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
