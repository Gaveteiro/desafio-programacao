class FixColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :id, :genre_id
    rename_column :movies, :id, :movie_id
  end
end
