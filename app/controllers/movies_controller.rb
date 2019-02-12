class MoviesController < ApplicationController

  def index
    @selected_genre_id = ""
    @movies_per_page = 10
    @num_page = params[:page]
    @genres = Genre.all
    if params[:genre] and params[:genre][:genre_id] and params[:genre][:genre_id] != ""
      @selected_genre_id = params[:genre][:genre_id]

      #page method uses the kanamari pagination to return a list of movies by page
      @movies = Movie.movies_per_genre(@selected_genre_id).page(params[:page]).per(@movies_per_page)
    else
      @movies = Movie.all.page(params[:page]).per(@movies_per_page)
    end

  end
end
