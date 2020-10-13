require 'rails_helper'

RSpec.describe MoviesService do
  xit "fetch top_rated_movies", :vcr do
    results = [{:popularity=>13.855,
                :vote_count=>881,
                :video=>false,
                :poster_path=>"/pci1ArYW7oJ2eyTo2NMYEKHHiCP.jpg",
                :id=>724089,
                :adult=>false,
                :backdrop_path=>"/jtAI6OJIWLWiRItNSZoWjrsUtmi.jpg",
                :original_language=>"en",
                :original_title=>"Gabriel's Inferno Part II",
                :genre_ids=>[10749],
                :title=>"Gabriel's Inferno Part II",
                :vote_average=>8.9,
                :overview=>
                 "Professor Gabriel Emerson finally learns the truth about Julia Mitchell's identity, but his realization comes a moment too late. Julia is done waiting for the well-respected Dante specialist to remember her and wants nothing more to do with him. Can Gabriel win back her heart before she finds love in another's arms?",
                :release_date=>"2020-07-31"},
               {:popularity=>14.457,
                :vote_count=>1474,
                :video=>false,
                :poster_path=>"/oyG9TL7FcRP4EZ9Vid6uKzwdndz.jpg",
                :id=>696374,
                :adult=>false,
                :backdrop_path=>"/969BfPHGJcjg2aUv60g5uiiXFzf.jpg",
                :original_language=>"en",
                :original_title=>"Gabriel's Inferno",
                :genre_ids=>[10749],
                :title=>"Gabriel's Inferno",
                :vote_average=>8.9,
                :overview=>
                 "An intriguing and sinful exploration of seduction, forbidden love, and redemption, Gabriel's Inferno is a captivating and wildly passionate tale of one man's escape from his own personal hell as he tries to earn the impossible--forgiveness and love.",
                :release_date=>"2020-05-29"}]

    movies_service = MoviesService.new
    search_results = movies_service.top_rated_movies(results)

    expect(search_results).to be_a(Array)

    expect(search_results).to have_key :popularity

    results = search_results[:popularity]

    expect(results).to be_an(Array)

    next_result = results.first

    expect(next_result).to have_key :name
    expect(next_result[:name]).to be_a(String)

    expect(next_result).to have_key :role
    expect(next_result[:role]).to be_a(String)

    expect(next_result).to have_key :district
    expect(next_result[:district]).to be_a(String)

    expect(next_result).to have_key :party
    expect(next_result[:party]).to be_a(String)
  end

  xit "fetch top_rated_movies", :vcr do
    search_string = "Happy Feet"

    movies_service = MoviesService.new
    search_results = movies_service.search_by_title(results, search_string)

    expect(search_results).to be_a(Array)

    expect(search_results).to have_key :popularity

    results = search_results[:popularity]

    expect(results).to be_an(Array)

    next_result = results.first

    expect(next_result).to have_key :name
    expect(next_result[:name]).to be_a(String)

    expect(next_result).to have_key :role
    expect(next_result[:role]).to be_a(String)

    expect(next_result).to have_key :district
    expect(next_result[:district]).to be_a(String)

    expect(next_result).to have_key :party
    expect(next_result[:party]).to be_a(String)
  end
end
