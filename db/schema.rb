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

ActiveRecord::Schema.define(version: 20160623014847) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "food_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "event_users", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "menu_id"
    t.string   "menu_name"
    t.boolean  "status"
    t.integer  "total",      default: 0
    t.date     "date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "food_subs", force: :cascade do |t|
    t.integer  "food_id"
    t.string   "description"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "foods", force: :cascade do |t|
    t.integer  "menu_id"
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "title"
    t.string   "phone"
    t.string   "address"
    t.boolean  "delivery"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "introduction"
  end

  create_table "official_holiday_options", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "official_holidays", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "official_holiday_option_id", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "official_holidays", ["menu_id"], name: "index_official_holidays_on_menu_id"
  add_index "official_holidays", ["official_holiday_option_id"], name: "index_official_holidays_on_official_holiday_option_id"

  create_table "order_infos", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "user_name"
    t.text     "note"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_notify",  default: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "food_name"
    t.integer  "price"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "total",      default: 0
    t.integer  "event_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_abandon", default: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "menu_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
