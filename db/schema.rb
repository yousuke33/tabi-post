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

ActiveRecord::Schema.define(version: 20161216031921) do

  create_table "guests", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guests", ["user_id"], name: "index_guests_on_user_id"

  create_table "owners", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "owners", ["user_id"], name: "index_owners_on_user_id"

  create_table "plan_budgets", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "plan_budgets", ["plan_id"], name: "index_plan_budgets_on_plan_id"

  create_table "plan_dates", force: :cascade do |t|
    t.integer  "plan_id"
    t.string   "start_dates"
    t.string   "finish_dates"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "plan_dates", ["plan_id"], name: "index_plan_dates_on_plan_id"

  create_table "plan_details", force: :cascade do |t|
    t.integer  "plan_id"
    t.string   "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "plan_details", ["plan_id"], name: "index_plan_details_on_plan_id"

  create_table "plan_num_of_customers", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "plan_num_of_customers", ["plan_id"], name: "index_plan_num_of_customers_on_plan_id"

  create_table "plan_places", force: :cascade do |t|
    t.integer  "plan_id"
    t.string   "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "plan_places", ["plan_id"], name: "index_plan_places_on_plan_id"

  create_table "plans", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "plans", ["user_id"], name: "index_plans_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
