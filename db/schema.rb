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

ActiveRecord::Schema.define(version: 20140907042803) do

  create_table "date_expiries", force: true do |t|
    t.date     "date_expiry"
    t.boolean  "completed",    default: false
    t.integer  "statistic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friend_lists", force: true do |t|
    t.integer  "request_user"
    t.integer  "confirm_user"
    t.integer  "is_confirm",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "function_roles", force: true do |t|
    t.string   "desciption"
    t.integer  "role_id"
    t.integer  "function_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions", force: true do |t|
    t.string   "controller"
    t.string   "action"
    t.string   "desciption"
    t.boolean  "enabled",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods", force: true do |t|
    t.string   "name"
    t.float    "price",      default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_chat_lists", force: true do |t|
    t.string   "name",       default: "ID 07/09/2014 13:03:39"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_chat_members", force: true do |t|
    t.integer  "group_chat_list_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_chats", force: true do |t|
    t.string   "message"
    t.integer  "group_chat_list_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", force: true do |t|
    t.float    "price"
    t.integer  "quantity",    default: 1
    t.float    "money_total"
    t.integer  "good_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_statistics", force: true do |t|
    t.integer  "order_id"
    t.integer  "statistic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "name"
    t.boolean  "liquidate"
    t.float    "money_total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.text     "desciption"
    t.boolean  "enabled",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statistics", force: true do |t|
    t.float    "money_init",      default: 400.0
    t.float    "money_last_week", default: 0.0
    t.float    "money_remain",    default: 0.0
    t.float    "money_payment",   default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", force: true do |t|
    t.string   "desciption"
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "full_name"
    t.string   "address"
    t.string   "phone"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
