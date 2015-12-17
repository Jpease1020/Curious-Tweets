class FriendsController < ApplicationController
  def index
    @friends = current_user.client.friends
  end

  def create
    current_user.client
    redirect_to dashboard_path
  end

  def destroy
    user = current_user.client.user(params[:id].to_i)
    current_user.client.unfollow(user)
    redirect_to friends_path
  end
end
