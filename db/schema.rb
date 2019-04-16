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

ActiveRecord::Schema.define(version: 2019_04_16_054319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "count"
    t.integer "purchase_year"
    t.bigint "user_id"
    t.bigint "color_id"
    t.bigint "season_id"
    t.bigint "category_id"
    t.bigint "occasion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["color_id"], name: "index_items_on_color_id"
    t.index ["occasion_id"], name: "index_items_on_occasion_id"
    t.index ["season_id"], name: "index_items_on_season_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "joints", force: :cascade do |t|
    t.bigint "outfit_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_joints_on_item_id"
    t.index ["outfit_id"], name: "index_joints_on_outfit_id"
  end

  create_table "occasions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outfits", force: :cascade do |t|
    t.bigint "weather_id"
    t.bigint "user_id"
    t.integer "high_temp"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_outfits_on_user_id"
    t.index ["weather_id"], name: "index_outfits_on_weather_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.string "description"
    t.string "icon_src"
    t.string "name"
    t.integer "icon"
    t.integer "high_temp"
    t.integer "low_temp"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "categories"
  add_foreign_key "items", "colors"
  add_foreign_key "items", "occasions"
  add_foreign_key "items", "seasons"
  add_foreign_key "items", "users"
  add_foreign_key "joints", "items"
  add_foreign_key "joints", "outfits"
  add_foreign_key "outfits", "users"
  add_foreign_key "outfits", "weathers"
end
