require 'net/http'
require 'json'
class MoviesAPI

  def initialize
    @uri = 'https://api.themoviedb.org/3'
    @api_key = '2f32c5a0f87c0811f3087553cbdf7657'
  end
  def get_genres()
    params = { :api_key =>@api_key}
    uri_temp = URI(@uri + "/genre/movie/list")
    uri_temp.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri_temp)
    data = JSON.parse(res.body)
    new_genres = []
    data['genres'].each { |dt| new_genres.push({'genre_id'=>dt['id'],'name' => dt['name']})   }
    Genre.create!(new_genres)
  end

  def get_upcoming_movies()
    params = { :api_key =>@api_key}
    uri_temp = URI(@uri + "/movie/upcoming")
    uri_temp.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri_temp)
    data = JSON.parse(res.body)
    new_movies = []
    data['results'].each {|dt| new_movies.push({
                            'movie_id'=> dt['id'],
                          'created_at'=> dt['created_at'],
                     'original_title' => dt['original_title'],
                  'original_language' => dt['original_language'],
                              'title' => dt['title'],
                              'genre_ids'=>dt['genre_ids'],
                              'adult' => dt['adult'],
                              'overview' => dt['overview'],
                              'poster_path' => dt['poster_path'],
                              'backdrop_path' => dt['backdrop_path'],
                              'vote_count' => dt['vote_count'],
                              'vote_average' => dt['vote_average'],
                              'popularity' => dt['popularity']


                              })}
    Movie.create!(new_movies)
  end
end
