require 'spec_helper'
require 'pry'

describe Ebert::Movie do
  it 'allows me to search for a list of movies' do
    movies = Ebert::Movie.search('Iron Man')
    expect(movies).to_not eql([])
    expect(movies.first).to be_kind_of(Ebert::Movie)

    expect(movies.first.title).to include('Iron Man')
  end
end
