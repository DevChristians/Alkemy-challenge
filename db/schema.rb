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

ActiveRecord::Schema[7.0].define(version: 2022_02_17_161601) do
  create_table "characters", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.integer "age"
    t.string "weight"
    t.text "history"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters_movies", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_characters_movies_on_character_id"
    t.index ["movie_id"], name: "index_characters_movies_on_movie_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_movies", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genres_movies_on_genre_id"
    t.index ["movie_id"], name: "index_genres_movies_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.date "creation_date"
    t.string "qualification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "characters_movies", "characters"
  add_foreign_key "characters_movies", "movies"
  add_foreign_key "genres_movies", "genres"
  add_foreign_key "genres_movies", "movies"
end
