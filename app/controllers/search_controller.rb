class SearchController < ApplicationController
  def index

    conn = Faraday.new(url: "https://api.themoviedb.org/3") do |faraday|
      faraday.params["api_key"] = "01f290a2d631a988135263d0ef1c81e1"
      # ENV["PROPUBLICA_API_KEY"]
    end
    binding.pry
    response = conn.get("/movie/top_rated")

    json = JSON.parse(response.body, symbolize_names: true)

    @members = json[:results]
  end
end

