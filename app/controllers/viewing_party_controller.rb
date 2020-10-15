class ViewingPartyController < ApplicationController
  def new
    movie = SearchFacade.new
    @movie = movie.get_summary(params[:id])
  end
end
