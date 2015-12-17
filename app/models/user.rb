class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  def favorites_count
    client.user.favorites_count
  end

  def followers_count
    client.user['followers_count']
  end

  def friends_count
    client.user["friends_count"]
  end

  def profile_image_url
    client.user.profile_image_url.to_s.sub("_normal.",".")
  end

  def statuses_count
    client.user["statuses_count"]
  end

  def dashboard_tweets
    client.home_timeline
  end

  def my_tweets
    client.user_timeline("Justin Pease")
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_key']
      config.consumer_secret     = ENV['twitter_secret']
      config.access_token        = oauth_token
      config.access_token_secret = oauth_token_secret
    end
  end
end
