require 'net/http'

class MoviesAPI

  class Genre
    attr_accessor :id, :name
    def initialize(id,name)
      @id = id
      @name = name
    end
  end

  class Movie
    attr_accessor :id, :id_genre, :created_at, :original_title, :original_language, :title, :vote_average
    def initialize(id,id_genre,created_at,original_title, original_language, title, vote_average)
      @id = id
      @id_genre = id_genre
      @created_at = created_at
      @original_title = original_title
      @original_language = original_language
      @title = title
      @vote_avareage = vote_average
    end
  end

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
    genre = data['genres'].map { |gnr| Genre.new(gnr['id'], gnr['name']) }
    return genre
  end

  def get_upcoming_movies()
    params = { :api_key =>@api_key}
    uri_temp = URI(@uri + "/movie/upcoming")
    uri_temp.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri_temp)
    data = JSON.parse(res.body)
    movies = data['results'].map { |movie| Movie.new(movie['id'], movie['genre_ids'], movie['created_at'], movie['original_title'], movie['original_language'], movie['title'], movie['vote_average']) }
    return movies
  end
end
