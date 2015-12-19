class FriendsController < ApplicationController

  attr_reader :client
  def client
    @client ||= TwitterService.new(current_user).client
  end

  def index
    @friends = client.friends
  end

  def create
    client
    redirect_to dashboard_path
  end

  def destroy
    user = client.user(params[:id].to_i)
    client.unfollow(user)
    redirect_to friends_path
  end
end
