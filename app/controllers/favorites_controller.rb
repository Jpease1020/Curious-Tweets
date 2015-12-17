class FavoritesController < ApplicationController

  def create
    current_user.client.favorite(params["tweet"])
    redirect_to dashboard_path
  end

  def destroy
    current_user.client.unfavorite(params["id"])
    redirect_to dashboard_path
  end
end
