class DashboardController < ApplicationController

  attr_reader :client
  def client
    @client ||= TwitterService.new(current_user).client
  end

  def index
    @user = client.user
    @tweets = client.home_timeline
    @my_tweets = client.user_timeline(@user)
  end
end
