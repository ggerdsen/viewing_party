class Search
  
  def self.get_movies(movie_count_limit, search_param)
    page = 1
    results = []
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = ENV["MOVIE_DB_API_KEY"]
    end
    until results.flatten.length >= movie_count_limit
      res = conn.get("#{search_param}") do |f|
        f.params["page"] = page
      end
      json = JSON.parse(res.body, symbolize_names: true)
      results << json[:results]
      page += 1
    end
    results.flatten
  end
  
  def no_movies
    
  end
end
