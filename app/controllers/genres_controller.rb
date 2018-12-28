class GenresController < ApplicationController
  def index
    @genres = Genre.all

    respond_to do |format|
      format.json do
        render json: @genres
      end
    end
  end
end
