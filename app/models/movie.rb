class Movie < ApplicationRecord
  has_and_belongs_to_many :genres

  def self.movies_per_genre(genre_id)
    Movie.all.joins(:genres).where("genres.genre_id = ?", genre_id)
  end
end
