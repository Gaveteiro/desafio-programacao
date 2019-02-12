require 'test_helper'

class MovieTest < ActiveSupport::TestCase
   test "movies_per_genre_should_return_only_movies_that_contain_the_genre" do
     genre = Genre.first
     Movie.create!('movie_id' => 1, 'title' => 'movie1', 'genre_ids' => [1] )
     Movie.create!('movie_id' => 2, 'title' => 'movie2', 'genre_ids' => [2] )
     Movie.create!('movie_id' => 3, 'title' => 'movie3', 'genre_ids' => [3] )

     movies = Movie.movies_per_genre(genre.genre_id)
     movies.each{ |mv|
        assert(mv.genre_ids.include? genre.genre_id)}
   end

   test "movies_per_genre_should_return_empty_if_no_movies_of_genre" do
     genre = Genre.find(1)
     Movie.create!('movie_id' => 2, 'title' => 'movie2', 'genre_ids' => [2] )
     Movie.create!('movie_id' => 3, 'title' => 'movie3', 'genre_ids' => [3] )

     movies = Movie.movies_per_genre(genre.genre_id)
     isEmpty = !movies.any?
     assert(isEmpty)
   end
end
