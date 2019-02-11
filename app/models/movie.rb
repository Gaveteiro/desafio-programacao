class Movie < ApplicationRecord
  has_and_belongs_to_many :genres
  #self.primary_key = [:movie_id]


end
