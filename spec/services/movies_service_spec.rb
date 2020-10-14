require 'rails_helper'

RSpec.describe MoviesService do
  it "fetch top_rated_movies", :vcr do

    movies_service = MoviesService.new
    search_results = movies_service.top_rated_movies

    expect(search_results).to be_a(Array)

    expect(search_results[0]).to have_key :popularity

    values = search_results[0].values

    expect(values[0]).to be_an(Float)
  end

  it "fetch search_by_title", :vcr do
    search_string = "Happy Feet"

    movies_service = MoviesService.new
    search_results = movies_service.search_by_title(search_string)

    expect(search_results).to be_a(Array)

    expect(search_results[0]).to have_key :title

    title = search_results[0][:title]

    expect(title).to be_an(String)

    expect(title).to eq("Happy Feet")
  end
end
