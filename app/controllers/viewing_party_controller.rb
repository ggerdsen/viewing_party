class ViewingPartyController < ApplicationController
  def new
    movie = SearchFacade.new
    @movie = movie.get_summary(params[:movie_id]).first
  end

#   def create
#     movie = SearchFacade.new
#     @movie = movie.get_summary(params[:movie_id]).first
#     @party = Party.new(party_params)
#     if @party.save
#       flash[:success] = 'Your viewing party has been created!'
#       redirect_to '/dashboard'
#     else
#       flash[:error] = 'Please try again'
#       render :new
#     end
#   end
#
#   private
#
#   def party_params
#     params.permit(:movie_title, :party_duration, :date, :start_time)
#   end
end
