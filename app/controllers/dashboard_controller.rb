class DashboardController < ApplicationController

  attr_reader :client
  def client
    @client ||= TwitterService.new(current_user).client
  end

  def index
    @user = client.user
    @tweets = client.home_timeline
    @my_tweets = User.my_tweetsclient
  end
end


# inside each method sending info over to the views, call the correct models/methods
