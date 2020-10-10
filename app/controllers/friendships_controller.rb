class FriendshipsController < ApplicationController
  def create
    @friend = User.find_by_email(user_params[:friends_email])
    if @friend
      @friendship = current_user.friendships.build(friend_id: @friend.id)
      if @friendship.save
        friend_success
      else
        friend_fail
      end
    else
      friend_fail
    end
  end

  private

  def friend_fail
    flash[:error] = 'Unable to add friend.'
    redirect_to '/dashboard'
  end

  def friend_success
    flash[:success] = "#{@friend.name} added to Friends!"
    redirect_to '/dashboard'
  end

  def user_params
    params.permit(:friends_email, :user_id)
  end
end
