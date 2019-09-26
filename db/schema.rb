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

ActiveRecord::Schema.define(version: 2019_09_26_130721) do

  create_table "games", force: :cascade do |t|
    t.integer "week_id"
    t.integer "home_id"
    t.integer "away_id"
    t.integer "home_score"
    t.integer "away_score"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_games", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.integer "quaffle_scored"
    t.integer "quaffle_saved"
    t.integer "bludger_smashed"
    t.integer "snitch_caught"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_playoff_games", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.integer "quaffle_scored"
    t.integer "quaffle_saved"
    t.integer "bludger_smashed"
    t.integer "snitch_caught"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer "team_id"
    t.string "name"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playoff_games", force: :cascade do |t|
    t.integer "week_id"
    t.integer "home_id"
    t.integer "away_id"
    t.integer "home_score"
    t.integer "away_score"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playoff_weeks", force: :cascade do |t|
    t.string "name"
    t.boolean "games_completed"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "wins"
    t.integer "losses"
    t.integer "points_for"
    t.integer "points_against"
    t.string "name"
    t.string "flag"
    t.string "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weeks", force: :cascade do |t|
    t.string "name"
    t.boolean "games_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date"
  end

end
