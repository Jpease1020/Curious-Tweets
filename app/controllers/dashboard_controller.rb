class DashboardController < ApplicationController
  def index
    @user = current_user.client.user
  end
end
