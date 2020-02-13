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

ActiveRecord::Schema.define(version: 20180409164224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "name"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "divisions", ["season_id"], name: "index_divisions_on_season_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["league_id"], name: "index_locations_on_league_id", using: :btree
  add_index "locations", ["active", "league_id"], name: "index_locations_on_active_and_league_id", using: :btree

  create_table "machines", force: :cascade do |t|
    t.bigint "league_id", null: false
    t.bigint "location_id", null: false
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "machines", ["league_id"], name: "index_machines_on_league_id", using: :btree
  add_index "machines", ["location_id"], name: "index_machines_on_location_id", using: :btree
  add_index "machines", ["active", "location_id"], name: "index_machines_on_active_and_location_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.bigint "meet_id", null: false
    t.bigint "location_id", null: false
    t.bigint "machine_id", null: false
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matches", ["meet_id"], name: "index_matches_on_meet_id", using: :btree
  add_index "matches", ["location_id"], name: "index_matches_on_location_id", using: :btree
  add_index "matches", ["machine_id"], name: "index_matches_on_machine_id", using: :btree

  create_table "machine_matches", force: :cascade do |t|
    t.bigint "machine_id", null: false
    t.bigint "match_id", null: false
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "machine_matches", ["machine_id"], name: "index_machine_matches_on_machine_id", using: :btree
  add_index "machine_matches", ["match_id"], name: "index_machine_matches_on_match_id", using: :btree

  create_table "meets", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "meets", ["season_id"], name: "index_meets_on_season_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree
  add_index "players", ["league_id"], name: "index_players_on_league_id", using: :btree

  create_table "scores", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "machine_id", null: false
    t.bigint "player_id", null: false
    t.bigint "season_id", null: false
    t.bigint "score", null: false
    t.boolean "disqualified", null: false, default: false
    t.integer "tie_break_order", null: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "scores", ["match_id"], name: "index_scores_on_match_id", using: :btree
  add_index "scores", ["machine_id"], name: "index_scores_on_machine_id", using: :btree
  add_index "scores", ["player_id"], name: "index_scores_on_player_id", using: :btree
  add_index "scores", ["season_id"], name: "index_scores_on_season_id", using: :btree

  create_table "scoring_rules", force: :cascade do |t|
    t.bigint "season_id", null: false
    t.integer "players", null: false
    t.integer "position", null: false
    t.integer "points", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "scoring_rules", ["season_id"], name: "index_scoring_rules_on_season_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "league_id", null: false
    t.datetime "start_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "seasons", ["league_id"], name: "index_seasons_on_league_id", using: :btree

end
