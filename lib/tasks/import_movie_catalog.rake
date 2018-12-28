desc "Import catalog of upcoming movies"
task :import_movie_catalog => :environment do
  # Popular banco de dados os os filmes

  require 'rest-client'

  # Limpar banco de dados primeiro

  Movie.destroy_all
  Genre.destroy_all

  # Obter todos os gêneros primeiro

  genres = JSON.parse(RestClient.get('https://api.themoviedb.org/3/genre/movie/list', params: {
    api_key: '5e5d53209ed6dc1be90cea6823b24335',
    language: 'pt-BR',
  }).body)

  genres = genres['genres'].map { |genre| genre['genre_id'] = genre['id']; genre.delete('id'); genre }

  Genre.create!(genres)

  print "Gêneros criados\n"

  # Consultar as 10 primeiras páginas

  10.times do |i|
    api_result = JSON.parse(RestClient.get('https://api.themoviedb.org/3/movie/upcoming', params: {
      api_key: '5e5d53209ed6dc1be90cea6823b24335',
      language: 'pt-BR',
      page: (i + 1).to_s
    }).body)

    movies = api_result['results'].map do |movie|
      movie.delete('id')
      genre_ids = movie.delete('genre_ids')
      movie['genre_ids'] = Genre.where(genre_id: genre_ids).select(:id).map { |g| g.id }
      movie
    end

    Movie.create!(movies)

    print "Página #{i + 1} percorrida\n"
  end
end
