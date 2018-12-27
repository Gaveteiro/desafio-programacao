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

ActiveRecord::Schema.define(version: 2018_12_26_234328) do

  create_table "genres", force: :cascade do |t|
    t.integer "genre_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "movie_id", null: false
    t.index ["genre_id", "movie_id"], name: "index_genres_movies_on_genre_id_and_movie_id"
    t.index ["movie_id", "genre_id"], name: "index_genres_movies_on_movie_id_and_genre_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "poster_path"
    t.boolean "adult", default: false
    t.string "overview"
    t.date "release_date"
    t.string "original_title"
    t.string "original_language"
    t.string "title"
    t.string "backdrop_path"
    t.decimal "popularity"
    t.integer "vote_count"
    t.boolean "video"
    t.decimal "vote_average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
