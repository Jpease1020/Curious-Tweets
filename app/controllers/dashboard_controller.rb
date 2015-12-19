class DashboardController < ApplicationController

  attr_reader :client
  def client
    @client ||= TwitterService.new(current_user).client
  end

  def index
    @user_info = client.user
    @tweets = client.home_timeline
    @my_tweets = client.user_timeline(@user)
  end
end


# inside each method sending info over to the views, call the correct models/methods
