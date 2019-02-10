require 'net/http'
require 'json'

class GeneroController < ApplicationController


  def index
    #!/usr/bin/env ruby

    require_relative '../app/models/genero.rb'

    uri = URI('https://api.themoviedb.org/3/genre/movie/list')
    params = { :api_key =>"2f32c5a0f87c0811f3087553cbdf7657"}
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    #puts res.body if res.is_a?(Net::HTTPSuccess)

    data = JSON.parse(res.body)

    generos = data['genres'].map { |gnr| Genero.new(gnr['name'], gnr['id']) }

    puts generos

  end
end
