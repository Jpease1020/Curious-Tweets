class UsersController < ApplicationController

  attr_reader :client
  def client
    @client ||= TwitterService.new(current_user).client
  end

  def show
    @user = client.user
    @tweets = client.home_timeline
  end
end
