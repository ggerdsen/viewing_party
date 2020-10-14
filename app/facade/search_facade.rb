class SearchFacade
  def initialize
    @movie_data = MoviesService.new
  end

  def movies_results(search_string)
    if !search_string.nil?
      find_movies(search_string)
    else
      top_40
    end
  end

  def top_40
    results = @movie_data.top_rated_movies
    results.map do |data|
      MovieSearch.new(data)
    end
  end

  def find_movies(search_string)
    results = @movie_data.search_by_title(search_string)
    results.map do |data|
      MovieSearch.new(data)
    end
  end
  
  def get_summary(id)
    summary = @movie_data.get_summary(id)
    map_data(summary)
  end
  
  def get_reviews(id)
    # binding.pry
    reviews = @movie_data.get_reviews(id)
    # map_data(reviews)
  end
  
  def get_credits(id)
    credits = @movie_data.get_credits(id)
    map_data(credits)
  end
  
  private
  
  def map_data(object)
    object.map do |data|
      MovieSearch.new(data)
    end
  end
end
