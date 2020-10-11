class Search
  
  def self.get_movies(movie_count_limit, endpoint, search_string = "")
    page = 1
    results = []
      conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
        faraday.params["api_key"] = ENV["MOVIE_DB_API_KEY"]
      end
      if search_string == ""
        top_40(movie_count_limit, endpoint, conn)
      else
        search_this(endpoint, search_string, conn)
      end
  end
  
  def self.top_40(movie_count_limit, endpoint, conn)
    page = 1
    results = []
    until results.flatten.length >= movie_count_limit
      res = conn.get("#{endpoint}") do |f|
        f.params["page"] = page
      end
      json = JSON.parse(res.body, symbolize_names: true)
      results << json[:results]
      page += 1
    end
    results.flatten
  end
  
  def self.search_this(endpoint, search, conn)
    page = 1
    results = []
    until results.flatten.length >= 40
      
      res = conn.get("#{endpoint}") do |f|
        f.params["page"] = page
        f.params["query"] = search
      end
      json = JSON.parse(res.body, symbolize_names: true)
      results << json[:results]
      page += 1
    end
    results.flatten
  end
end
