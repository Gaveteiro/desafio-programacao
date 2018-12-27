class Movie < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :overview, allow_blank: true
  validates_presence_of :original_language

  has_and_belongs_to_many :genres
end
