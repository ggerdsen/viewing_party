class UsersController < ApplicationController
  def index; end

  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You are now registered and logged in as #{@user.name}"
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      flash[:error] = @user.errors.full_messages.uniq.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
