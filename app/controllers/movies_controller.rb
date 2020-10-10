class MoviesController < ApplicationController
  def index
    if !params[:search_string].nil?
      @movies = Search.get_movies(40, params[:search_string])
    end
  end
end