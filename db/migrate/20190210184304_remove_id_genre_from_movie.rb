class RemoveIdGenreFromMovie < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :id_genre, :integer
  end
end
