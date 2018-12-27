class CreateGenreMovieStructure < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :poster_path
      t.boolean :adult, default: false
      t.string :overview
      t.date :release_date
      t.string :original_title
      t.string :original_language
      t.string :title
      t.string :backdrop_path
      t.decimal :popularity
      t.integer :vote_count
      t.boolean :video
      t.decimal :vote_average

      t.timestamps
    end

    create_table :genres do |t|
      t.integer :genre_id #primary key id is distinct from genre id
      t.string :name

      t.timestamps
    end

    create_join_table :genres, :movies do |t|
      t.index [:genre_id, :movie_id]
      t.index [:movie_id, :genre_id]
    end
  end
end
