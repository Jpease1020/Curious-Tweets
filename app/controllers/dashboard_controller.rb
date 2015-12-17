class DashboardController < ApplicationController
  def index
    @user = current_user.client.user
    @tweets = current_user.client.home_timeline
    @my_tweets = current_user.client.user_timeline(@user)
  end
end
