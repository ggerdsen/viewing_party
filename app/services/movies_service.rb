class MoviesService
  def top_rated_movies(results)
    both_pages = []
    page1 = conn.get('3/movie/top_rated?page=1')
    page2 = conn.get('3/movie/top_rated?page=2')
    both_pages << page1_results(results, page1)
    both_pages << page2_results(results, page2)
    both_pages.flatten
  end

  def search_by_title(results, search_string)
    both_pages = []
    page1 = conn.get("3/search/movie?query=#{search_string}&page=1")
    page2 = conn.get("3/search/movie?query=#{search_string}&page=2")
    both_pages << page1_results(results, page1)
    both_pages << page2_results(results, page2)
    both_pages.flatten
  end

  private

  def page1_results(results, page1)
    results1 = JSON.parse(page1.body, symbolize_names: true)
    results1[:results]
  end

  def page2_results(results, page2)
    results2 = JSON.parse(page2.body, symbolize_names: true)
    results2[:results]
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['MOVIE_DB_API_KEY']
    end
  end
end
