class MoviesController < ApplicationController
  def index
    search_string = params[:search_string]
    if search_string == ""
      flash[:error] = 'Please enter keywords for your search'
      redirect_to '/movies'
    else
      return_results(search_string)
    end
  end
  
  def show
    movie = SearchFacade.new
    @movie_summary = movie.get_summary("#{params[:id]}")
    @reviews = movie.get_reviews("#{params[:id]}")
    @credits = movie.get_credits("#{params[:id]}")
  end

  def return_results(search_string)
    movie = SearchFacade.new
    @movies = movie.movies_results(search_string)
  end
end
