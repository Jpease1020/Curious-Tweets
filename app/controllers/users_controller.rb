class UsersController < ApplicationController
  def show
    @user = current_user.client.user
    #have the route call the model, the model call the services 
  end
end
