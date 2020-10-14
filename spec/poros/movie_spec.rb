require 'rails_helper'

RSpec.describe Movie do
  it "exists" do
    attr = {
      title: "Casablanca",
      vote_average: 8.4,
      id: 12
    }

    movie = Movie.new(attr)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq("Casablanca")
    expect(movie.vote_average).to eq(8.4)
    expect(movie.id).to eq(12)
  end
end
