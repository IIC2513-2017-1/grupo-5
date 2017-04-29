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

ActiveRecord::Schema.define(version: 20170429223748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.integer  "ammount",    null: false
    t.integer  "bet_state",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "match_id"
    t.integer  "user_id"
    t.integer  "team_id"
    t.index ["match_id"], name: "index_bets_on_match_id", using: :btree
    t.index ["team_id"], name: "index_bets_on_team_id", using: :btree
    t.index ["user_id"], name: "index_bets_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.text     "event_type", null: false
    t.boolean  "private",    null: false
    t.date     "date_start", null: false
    t.date     "date_end",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.date     "match_date", null: false
    t.date     "bet_date",   null: false
    t.text     "name"
    t.integer  "state",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
    t.index ["event_id"], name: "index_matches_on_event_id", using: :btree
  end

  create_table "participations", force: :cascade do |t|
    t.integer "placing",  null: false
    t.integer "match_id"
    t.integer "team_id"
    t.index ["match_id"], name: "index_participations_on_match_id", using: :btree
    t.index ["team_id"], name: "index_participations_on_team_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.text     "name"
    t.string   "description"
    t.string   "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teams", force: :cascade do |t|
    t.text     "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "email",      null: false
    t.text     "first_name"
    t.text     "last_name"
    t.text     "password",   null: false
    t.integer  "coins",      null: false
    t.integer  "role",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "bets", "matches"
  add_foreign_key "bets", "teams"
  add_foreign_key "bets", "users"
  add_foreign_key "events", "users"
  add_foreign_key "matches", "events"
  add_foreign_key "participations", "matches"
  add_foreign_key "participations", "teams"
end
