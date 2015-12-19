class FavoritesController < ApplicationController

  attr_reader :client
  def client
    @client ||= TwitterService.new(current_user).client
  end

  def create
    client.favorite(params["tweet"])
    redirect_to dashboard_path
  end

  def destroy
    client.unfavorite(params["id"])
    redirect_to dashboard_path
  end
end
