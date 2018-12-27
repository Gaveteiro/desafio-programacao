class Genre < ApplicationRecord
  validates_presence_of :genre_id
  validates_presence_of :name

  has_and_belongs_to_many :movies
end
