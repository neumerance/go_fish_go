# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_18_084722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_requests", force: :cascade do |t|
    t.bigint "game_player_id"
    t.bigint "card_id"
    t.boolean "complied", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_requests_on_card_id"
    t.index ["game_player_id"], name: "index_card_requests_on_game_player_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "value"
    t.string "image"
    t.string "suit"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_players", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_players_on_game_id"
    t.index ["player_id"], name: "index_game_players_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.boolean "in_progress", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_on_hand_cards", force: :cascade do |t|
    t.bigint "game_player_id"
    t.bigint "card_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_player_on_hand_cards_on_card_id"
    t.index ["game_player_id"], name: "index_player_on_hand_cards_on_game_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recieved_cards", force: :cascade do |t|
    t.bigint "game_player_id"
    t.bigint "card_id"
    t.boolean "recieved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_recieved_cards_on_card_id"
    t.index ["game_player_id"], name: "index_recieved_cards_on_game_player_id"
  end

end
