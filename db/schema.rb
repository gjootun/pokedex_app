# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_11_13_042409) do
  create_table "element_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "pokedex_number"
    t.integer "height"
    t.integer "weight"
    t.integer "base_experience"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.integer "trainer_id", null: false
    t.integer "pokemon_id", null: false
    t.string "nickname"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_team_members_on_pokemon_id"
    t.index ["trainer_id"], name: "index_team_members_on_trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "hometown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typings", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "element_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element_type_id"], name: "index_typings_on_element_type_id"
    t.index ["pokemon_id"], name: "index_typings_on_pokemon_id"
  end

  add_foreign_key "team_members", "pokemons"
  add_foreign_key "team_members", "trainers"
  add_foreign_key "typings", "element_types"
  add_foreign_key "typings", "pokemons"
end
