require 'rails_helper'

RSpec.describe 'Search Facade' do
  it "can test movies_results method", :vcr do
    search_string = 'Happy Feet'

    movies_search = SearchFacade.new
    movies = movies_search.movies_results(search_string)

    expect(movies).to be_an(Array)
    expect(movies.first).to be_a(MovieSearch)
    expect(movies.first.title).to be_a(String)
  end

  it "can test top_40 method", :vcr do

    top_40_search = SearchFacade.new
    movies = top_40_search.top_40

    expect(movies).to be_an(Array)
    expect(movies.first).to be_a(MovieSearch)
    expect(movies.first.title).to be_a(String)
    expect(movies.length).to eq(40)
  end

  it "can test find_movies method", :vcr do
    search_string = 'Happy Feet'

    find_movies_search = SearchFacade.new
    movies = find_movies_search.find_movies(search_string)

    expect(movies).to be_an(Array)
    expect(movies.first).to be_a(MovieSearch)
    expect(movies.first.title).to be_a(String)
    expect(movies.length).to eq(2)

  end

end
