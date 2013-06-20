require "ebert/version"

require "ebert/movie"

module Ebert
  def self.api_key
    @api_token
  end

  def self.api_key=(token)
    @api_token = token
  end
end
