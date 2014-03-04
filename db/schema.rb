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

ActiveRecord::Schema.define(version: 20140302191715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: true do |t|
    t.string   "gtfs_agency_id"
    t.string   "name"
    t.string   "url"
    t.string   "timezone"
    t.string   "lang"
    t.string   "phone"
    t.string   "fare_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alerts", force: true do |t|
    t.string   "alert_type"
    t.integer  "alert_distance" # KB changed to integer from string
    t.integer  "journey_id"
    t.integer  "stop_time_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alerts", ["journey_id"], name: "index_alerts_on_journey_id", using: :btree
  add_index "alerts", ["stop_time_id"], name: "index_alerts_on_stop_time_id", using: :btree

  create_table "journeys", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journeys", ["user_id"], name: "index_journeys_on_user_id", using: :btree

  create_table "routes", force: true do |t|
    t.string   "gtfs_route_id"
    t.string   "gtfs_agency_id"
    t.string   "short_name"
    t.string   "long_name"
    t.string   "desc"
    t.integer  "route_type"
    t.string   "url"
    t.string   "color"
    t.string   "text_color"
    t.integer  "agency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "outbound"
    t.string   "inbound"
  end

  add_index "routes", ["agency_id"], name: "index_routes_on_agency_id", using: :btree

  create_table "stop_times", force: true do |t|
    t.string   "gtfs_trip_id"
    t.time     "arrival_time"
    t.time     "departure_time"
    t.string   "gtfs_stop_id"
    t.integer  "sequence"
    t.string   "headsign"
    t.integer  "pickup_type"
    t.integer  "drop_off_type"
    t.float    "shape_dist_traveled"
    t.integer  "trip_id"
    t.integer  "stop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stop_times", ["stop_id"], name: "index_stop_times_on_stop_id", using: :btree
  add_index "stop_times", ["trip_id"], name: "index_stop_times_on_trip_id", using: :btree

  create_table "stops", force: true do |t|
    t.string   "gtfs_stop_id"
    t.string   "code"
    t.string   "name"
    t.string   "desc"
    t.float    "lat"
    t.float    "lon"
    t.string   "zone_id"
    t.string   "url"
    t.string   "location_type"
    t.string   "parent_station"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "gtfs_route_id"
    t.string   "gtfs_service_id"
    t.string   "gtfs_trip_id"
    t.string   "headsign"
    t.string   "short_name"
    t.integer  "direction_id"
    t.string   "block_id"
    t.string   "shape_id"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trips", ["route_id"], name: "index_trips_on_route_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_salt"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
