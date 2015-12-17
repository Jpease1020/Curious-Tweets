class TweetsController < ApplicationController
  def create
    current_user.client.update(params[:tweet])
    redirect_to dashboard_path
  end

  def edit
  end

  def update
    current_user.client.update(params["id"], text: "I can updat a tweet")
    redirect_to dashboard_path
  end

  def destroy
    current_user.client.destroy_status(params["id"])
    redirect_to dashboard_path
  end
end
