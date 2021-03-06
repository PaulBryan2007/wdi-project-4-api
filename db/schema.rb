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

ActiveRecord::Schema.define(version: 20161026180751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "ticket_id"
    t.string   "home"
    t.string   "away"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_games_on_ticket_id", using: :btree
  end

  create_table "swaps", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "ticket_id"
    t.string   "status"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_swaps_on_game_id", using: :btree
    t.index ["ticket_id"], name: "index_swaps_on_ticket_id", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "club"
    t.string   "image"
    t.integer  "value"
    t.boolean  "family_enclosure"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "team"
    t.string   "image"
    t.integer  "quantity_owned"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "games", "tickets"
  add_foreign_key "swaps", "games"
  add_foreign_key "swaps", "tickets"
  add_foreign_key "tickets", "users"
end
