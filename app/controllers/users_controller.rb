class UsersController < ApplicationController
  def show
    @user = current_user.client.user
  end
end
