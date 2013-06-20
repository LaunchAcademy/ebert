require 'faraday'
require 'json'

module Ebert
  class Movie
    attr_reader :title

    def initialize(attributes = {})
      @title = attributes['title']
    end

    class << self
      def search(phrase)
        res = connection.get '/api/public/v1.0/movies.json', {
          q: phrase,
          apikey: Ebert.api_key
        }

        res = JSON.parse(res.body)
        if res['movies']
          res['movies'].map do |movie_hash|
            new(movie_hash)
          end
        end
      end

      protected
      def connection
        #TODO: research consistent prefix and default params to keep it DRY
        conn ||= Faraday.new(:url => 'http://api.rottentomatoes.com') do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end
  end
end
