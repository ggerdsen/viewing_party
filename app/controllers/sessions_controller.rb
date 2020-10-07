class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:error] = 'Your login credentials are incorrect'
      redirect_to root_path
    end
  end
end
