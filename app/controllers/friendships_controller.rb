class FriendshipsController < ApplicationController
  def create
    @friend = User.find_by(email: user_params[:friends_email])
    if @friend
      create_friendship
    else
      friendship_failed
    end
  end

  private

  def create_friendship
    @friendship = current_user.friendships.build(friend_id: @friend.id)
    if @friendship.save
      flash[:success] = "#{@friend.name} added to Friends!"
      redirect_to '/dashboard'
    else
      friendship_failed
    end
  end

  def friendship_failed
    flash[:error] = 'Unable to add friend.'
    redirect_to '/dashboard'
  end

  def user_params
    params.permit(:friends_email, :user_id)
  end
end
