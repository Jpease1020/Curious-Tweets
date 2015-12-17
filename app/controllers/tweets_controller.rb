class TweetsController < ApplicationController
  def create
    current_user.client.update(params[:tweet])
    redirect_to dashboard_path
  end

  def update
  end

  def destroy
    byebug
    current_user.client.destroy_status(params[:tweet])
  end
end
