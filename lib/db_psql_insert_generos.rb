#!/usr/bin/env ruby

require_relative 'movies_api.rb'
require 'pg'


class ImportaGeneros
  def initialize
  end
  def get_genres
    moviesAPI = MoviesAPI.new
    genres = moviesAPI.get_genres
    return genres
  end
  def get_upcoming_movies
    moviesAPI = MoviesAPI.new
    movies = moviesAPI.get_upcoming_movies
    return movies
  end
  def clearing_tables
    conn = PG::Connection.open(:dbname => 'gaveteiro_development')
    conn.exec_params("DELETE FROM genres;")
    conn.exec_params("DELETE FROM movies;")
    conn.exec_params("DELETE FROM genres_movies;")
  end

  def insertGenres
    conn = PG::Connection.open(:dbname => 'gaveteiro_development')
    genres = get_genres()
    #genres.each{ |gnr| puts gnr.id  }
    genres.each{ |gnr| conn.exec_params("INSERT INTO genres (genre_id,name) VALUES ($1,$2)", [gnr.id,gnr.name])}
  end

  def insertMovies
    conn = PG::Connection.open(:dbname => 'gaveteiro_development')
    movies = get_upcoming_movies()

    movies.each{ |movie|
      #puts movie.title
      #movie.id_genre.each{ |id| print [movie.id, id]}
      movie.id_genre.each{
         |id| conn.exec_params("INSERT INTO genres_movies (movie_id,genre_id) VALUES ($1,$2)", [movie.id, id])
      }
    }
    movies.each{ |movie|
      conn.exec_params("INSERT INTO movies (movie_id,created_at, original_title, original_language, title) VALUES ($1,$2,$3,$4,$5)", [movie.id, movie.created_at, movie.original_title, movie.original_language, movie.title])
    }

  end


end

importa = ImportaGeneros.new
#importa.insertMovies
#importa.insertMovies
importa.clearing_tables
importa.insertMovies
importa.insertGenres
