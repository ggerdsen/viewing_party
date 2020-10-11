class MoviesController < ApplicationController
  def index
    if params[:endpoint] == "3/movie/top_rated"
      @top_40_movies = Search.get_movies(40, params[:endpoint])
    elsif !params[:search_string].nil?
      @search_results = Search.get_movies(40, "3/search/keyword", params[:search_string])
    end
  end
end