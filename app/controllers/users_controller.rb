class UsersController < ApplicationController
  def show
    @user = current_user.client.user
    @tweets = current_user.client.home_timeline
  end
end
