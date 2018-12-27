class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html
      format.json do
        render json: @movies
      end
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
