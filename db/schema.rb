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

ActiveRecord::Schema.define(version: 20160502142927) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id",    limit: 4
    t.integer  "food_id",    limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "quantity",   limit: 4, default: 1
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "event_id",   limit: 4
  end

  create_table "event_users", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "menu_id",    limit: 4
    t.string   "menu_name",  limit: 255
    t.boolean  "status"
    t.integer  "total",      limit: 4,   default: 0
    t.date     "date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "foods", force: :cascade do |t|
    t.integer  "menu_id",    limit: 4
    t.string   "name",       limit: 255
    t.integer  "price",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "phone",        limit: 255
    t.string   "address",      limit: 255
    t.boolean  "delivery"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "introduction", limit: 65535
  end

  create_table "official_holiday_options", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "official_holidays", force: :cascade do |t|
    t.integer  "menu_id",                    limit: 4
    t.integer  "official_holiday_option_id", limit: 4, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "official_holidays", ["menu_id"], name: "index_official_holidays_on_menu_id", using: :btree
  add_index "official_holidays", ["official_holiday_option_id"], name: "index_official_holidays_on_official_holiday_option_id", using: :btree

  create_table "order_infos", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.string   "user_name",  limit: 255
    t.text     "note",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.string   "food_name",  limit: 255
    t.integer  "price",      limit: 4
    t.integer  "quantity",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "total",      limit: 4, default: 0
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "menu_id",    limit: 4
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "is_admin",                           default: false
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
