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

ActiveRecord::Schema.define(version: 20160307072938) do

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer  "railway_station_id", null: false
    t.integer  "route_id",           null: false
    t.integer  "station_pos"
    t.datetime "arrive_time"
    t.datetime "departure_time"
  end

  add_index "railway_stations_routes", ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id"

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.integer  "train_id"
    t.integer  "start_railway_station_id"
    t.integer  "finish_railway_station_id"
    t.string   "fio"
  end

  add_index "tickets", ["finish_railway_station_id"], name: "index_tickets_on_finish_railway_station_id"
  add_index "tickets", ["start_railway_station_id"], name: "index_tickets_on_start_railway_station_id"
  add_index "tickets", ["train_id"], name: "index_tickets_on_train_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "wagons_order_asc"
    t.integer  "route_id"
  end

  add_index "trains", ["route_id"], name: "index_trains_on_route_id"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "fio"
  end

  create_table "wagons", force: :cascade do |t|
    t.integer "train_id"
    t.string  "wagon_type"
    t.integer "down_seats"
    t.integer "up_seats"
    t.string  "type"
    t.integer "side_up_seats"
    t.integer "side_down_seats"
    t.integer "seat_places"
    t.integer "pos"
  end

  add_index "wagons", ["train_id"], name: "index_wagons_on_train_id"

end
