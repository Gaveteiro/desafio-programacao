class MoviesController < ApplicationController

  def index
    if params[:genre] and params[:genre][:genre_id]
      @movies = Movie.joins(:genres).where('genres.genre_id = ?', "#{params[:genre][:genre_id]}")
    else
      @movies = Movie.all
    end

    @genres = Genre.all

  end

  #def movie_params
  #  params.require(:genre).permit(:genre_id)
  #end


end
