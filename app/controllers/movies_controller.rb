class MoviesController < ApplicationController

  def index
    @selected_genre_id = ""
    if params[:genre] and params[:genre][:genre_id] and params[:genre][:genre_id] != ""
      #puts "*"+params[:genre][:genre_id]+"*"
      @selected_genre_id = params[:genre][:genre_id]
      @movies = Movie.joins(:genres).where('genres.genre_id = ?', "#{params[:genre][:genre_id]}").page(params[:page]).per(5)
    else
      @movies = Movie.all.page(params[:page]).per(5)
    end

    @genres = Genre.all

  end

  #def movie_params
  #  params.require(:genre).permit(:genre_id)
  #end


end
