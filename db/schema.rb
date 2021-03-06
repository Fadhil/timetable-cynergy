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

ActiveRecord::Schema.define(version: 20170123113906) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "salutation",              limit: 255
    t.string   "full_name",               limit: 255
    t.string   "staff_id",                limit: 255
    t.string   "designation",             limit: 255
    t.string   "office_telephone_number", limit: 255
    t.string   "mobile_telephone_number", limit: 255
    t.string   "employment_type",         limit: 255
    t.string   "qualification",           limit: 255
    t.string   "field_of_knowledge",      limit: 255
    t.string   "technical_skills",        limit: 255
    t.string   "personal_skills",         limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id",                 limit: 4
    t.integer  "faculty_id",              limit: 4
  end

  add_index "profiles", ["faculty_id"], name: "index_profiles_on_faculty_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "programme_modules", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "code",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id", limit: 4
  end

  add_index "programme_modules", ["category_id"], name: "index_programme_modules_on_category_id", using: :btree

  create_table "programme_modules_registrations", id: false, force: :cascade do |t|
    t.integer "registration_id",     limit: 4, null: false
    t.integer "programme_module_id", limit: 4, null: false
  end

  create_table "programme_modules_sessions", id: false, force: :cascade do |t|
    t.integer "programme_session_id", limit: 4, null: false
    t.integer "programme_module_id",  limit: 4, null: false
  end

  add_index "programme_modules_sessions", ["programme_module_id", "programme_session_id"], name: "module_session_id", using: :btree
  add_index "programme_modules_sessions", ["programme_session_id", "programme_module_id"], name: "session_module_id", using: :btree

  create_table "programme_sessions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active",                 default: true
    t.boolean  "completed",              default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "weekly_teaching_hours", limit: 4
    t.string   "required_venue",        limit: 255
    t.text     "required_stationery",   limit: 65535
    t.text     "required_equipment",    limit: 65535
    t.text     "additional_notes",      limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id",               limit: 4
    t.integer  "programme_session_id",  limit: 4
    t.string   "other_venue",           limit: 255
    t.integer  "venue_id",              limit: 4
    t.text     "timetable",             limit: 65535
  end

  add_index "registrations", ["programme_session_id"], name: "index_registrations_on_programme_session_id", using: :btree
  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id", using: :btree
  add_index "registrations", ["venue_id"], name: "index_registrations_on_venue_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "roles", ["user_id"], name: "index_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "profiles", "faculties"
  add_foreign_key "profiles", "users"
  add_foreign_key "programme_modules", "categories"
  add_foreign_key "registrations", "programme_sessions"
  add_foreign_key "registrations", "users"
  add_foreign_key "registrations", "venues"
  add_foreign_key "roles", "users"
end
