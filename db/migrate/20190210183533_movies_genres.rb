class MoviesGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :movies_genres, id: false do |t|
     t.belongs_to :movie, index: true
     t.belongs_to :genre, index: true
   end
  end
end
