class SearchController < ApplicationController
  def index

    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = "01f290a2d631a988135263d0ef1c81e1"
      # ENV["MOVIE_DB_API_KEY"]
    end
    
    response = conn.get("/3/movie/top_rated")
    binding.pry

    json = JSON.parse(response.body, symbolize_names: true)

    @members = json[:results]
  end
end

# def get_movies(movie_count_limit)
# page=1
# results = []
# until results.length >= movie_count_limit
#   res = conn.get('/etc/etc') do |f|
#     f.params['page'] = page
#   end
#   get results from 'res'
#   shovel movies into 'results' array
#   page += 1
# end
# return "results.first(movie_count_limit)"
# end