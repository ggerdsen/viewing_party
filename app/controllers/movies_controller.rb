class MoviesController < ApplicationController
  def index
    if params[:endpoint] == "3/movie/top_rated"
      @top_40_movies = Search.get_movies(40, params[:endpoint])
    elsif !params[:search_string].nil?
      @search_results = Search.get_movies(40, "3/search/keyword", params[:search_string])
    end
  end
  
  def show
    # binding.pry
    @movie = Search.get_movies(1, "3/movie/#{params[:id]}")
    # response = conn.get("3/movie/#{params[:id]}?api_key=#{movies_api_key}")
    # @movie = JSON.parse(response.body, symbolize_names: true)
  end
end