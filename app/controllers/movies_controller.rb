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
    # binding.pry
    movie = SearchFacade.new
    @movie = movie.show_movie("3/movie/#{params[:id]}")
  end

  def return_results(search_string)
    movie = SearchFacade.new
    @movies = movie.movies_results(search_string)
  end
end
