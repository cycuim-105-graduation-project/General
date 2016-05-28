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

ActiveRecord::Schema.define(version: 20160528151412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendas", force: :cascade do |t|
    t.string   "name"
    t.string   "speaker"
    t.text     "description"
    t.integer  "event_id"
    t.integer  "location_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_agendas_on_event_id", using: :btree
    t.index ["location_id"], name: "index_agendas_on_location_id", using: :btree
  end

  create_table "beacons", force: :cascade do |t|
    t.string   "bid"
    t.integer  "event_id"
    t.integer  "location_id"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_beacons_on_event_id", using: :btree
    t.index ["location_id"], name: "index_beacons_on_location_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "quota"
    t.integer  "location_id"
    t.datetime "start_at"
    t.string   "end_at"
    t.string   "datatime"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_events_on_location_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "follwing_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["follower_id"], name: "index_friendships_on_follower_id", using: :btree
    t.index ["follwing_id"], name: "index_friendships_on_follwing_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "phone"
    t.string   "company"
    t.string   "position"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_registrations_on_event_id", using: :btree
    t.index ["user_id"], name: "index_registrations_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_skills_on_profile_id", using: :btree
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "facebook_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vote_options", force: :cascade do |t|
    t.text     "content"
    t.integer  "vote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vote_id"], name: "index_vote_options_on_vote_id", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "event_id"
    t.integer  "agenda_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["agenda_id"], name: "index_votes_on_agenda_id", using: :btree
    t.index ["event_id"], name: "index_votes_on_event_id", using: :btree
  end

  add_foreign_key "agendas", "events"
  add_foreign_key "agendas", "locations"
  add_foreign_key "beacons", "events"
  add_foreign_key "beacons", "locations"
  add_foreign_key "events", "locations"
  add_foreign_key "profiles", "users"
  add_foreign_key "registrations", "events"
  add_foreign_key "registrations", "users"
  add_foreign_key "skills", "profiles"
  add_foreign_key "vote_options", "votes"
  add_foreign_key "votes", "agendas"
  add_foreign_key "votes", "events"
end
