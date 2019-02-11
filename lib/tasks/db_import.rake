require_relative('movies_api.rb')

namespace :db_import do
  desc "importing genres and movies from API"
  task import_api: :environment do
    Movie.destroy_all
    Genre.destroy_all
    import = MoviesAPI.new
    import.get_genres
    import.get_upcoming_movies
  end

end
