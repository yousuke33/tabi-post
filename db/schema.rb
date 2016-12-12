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

ActiveRecord::Schema.define(version: 20161212123400) do

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
    t.integer  "start_dates"
    t.integer  "finish_dates"
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

  create_table "plan_num_of_people", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "num_of_people"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "plan_num_of_people", ["plan_id"], name: "index_plan_num_of_people_on_plan_id"

  create_table "plan_places", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "coordinate"
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

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

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

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
