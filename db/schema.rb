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

ActiveRecord::Schema.define(version: 20170223141833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "facebook"
    t.boolean  "has_donated"
    t.boolean  "signed_up"
    t.boolean  "wants_to_be_mechanic"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "email_confirmed",      default: false
    t.string   "confirm_token"
  end

  create_table "donations", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "donor_id"
    t.string   "pickup_location"
    t.integer  "bikes",           default: 0
    t.boolean  "parts",           default: false
    t.string   "notes"
  end

  add_index "donations", ["donor_id"], name: "index_donations_on_donor_id", using: :btree

  create_table "donors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_volunteers", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_volunteers", ["event_id"], name: "index_event_volunteers_on_event_id", using: :btree
  add_index "event_volunteers", ["user_id"], name: "index_event_volunteers_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "organizer_id"
    t.integer  "volunteer_spaces"
    t.integer  "order_spaces"
    t.string   "name"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "mens_bikes"
    t.integer  "womens_bikes"
    t.integer  "kids_bikes"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "notes"
    t.integer  "customer_id"
    t.integer  "event_id"
    t.integer  "status"
    t.string   "declined_events", default: [],              array: true
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "pickups", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "experience"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "donations", "donors"
  add_foreign_key "orders", "customers"
end
