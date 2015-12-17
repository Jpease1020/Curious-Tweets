class TweetsController < ApplicationController
  def create
    current_user.client.update(params[:tweet])
    redirect_to dashboard_path
  end

  def destroy
    current_user.client.destroy_status(params["id"])
    redirect_to dashboard_path
  end

  def retweet
    current_user.client.retweet(params["tweet"])
    redirect_to dashboard_path
  end
end
