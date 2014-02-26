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

ActiveRecord::Schema.define(version: 20140226072505) do

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
  end

  add_index "routes", ["agency_id"], name: "index_routes_on_agency_id", using: :btree

end
