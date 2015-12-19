class TweetsController < ApplicationController

  attr_reader :client
  def client
    @client ||= TwitterService.new(current_user).client
  end

  def create
    client.update(params[:tweet])
    redirect_to dashboard_path
  end

  def destroy
    client.destroy_status(params["id"])
    redirect_to dashboard_path
  end

  def retweet
    client.retweet(params["tweet"])
    redirect_to dashboard_path
  end
end
