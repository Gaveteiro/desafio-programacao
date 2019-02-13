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

ActiveRecord::Schema.define(version: 2019_02_13_055300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genres", primary_key: "genre_id", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at"
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "genre_id"
    t.index ["genre_id"], name: "index_genres_movies_on_genre_id"
    t.index ["movie_id"], name: "index_genres_movies_on_movie_id"
  end

  create_table "movies", primary_key: "movie_id", force: :cascade do |t|
    t.datetime "created_at"
    t.string "original_title"
    t.string "original_language"
    t.string "title"
    t.float "popularity"
    t.boolean "adult"
    t.string "poster_path"
    t.string "overview"
    t.string "backdrop_path"
    t.float "vote_average"
    t.integer "vote_count"
    t.string "release_date"
  end

end
