class FavoritesController < ApplicationController

  def create
    current_user.client.favorite(params["tweet"])
    redirect_to dashboard_path
  end

  def delete
    
    current_user.client.unfavorite(params["tweet"])
    redirect_to dashboard_path
  end
end
