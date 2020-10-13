require 'rails_helper'

RSpec.describe MovieSearch do
  it "exists" do
    attr = {
      title: "Casablanca",
      vote_average: 8.4,
      id: 12
    }

    movie_search = MovieSearch.new(attr)

    expect(movie_search).to be_a(MovieSearch)
    expect(movie_search.title).to eq("Casablanca")
    expect(movie_search.vote_average).to eq(8.4)
    expect(movie_search.id).to eq(12)
  end
end
