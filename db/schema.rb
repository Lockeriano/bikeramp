# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_124_131_305) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'trips', force: :cascade do |t|
    t.integer 'price_subunit'
    t.float 'distance'
    t.date 'date'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'waypoints', force: :cascade do |t|
    t.string 'lat'
    t.string 'lng'
    t.string 'address'
    t.string 'type'
    t.bigint 'trip_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['trip_id'], name: 'index_waypoints_on_trip_id'
  end

  add_foreign_key 'waypoints', 'trips'
end
