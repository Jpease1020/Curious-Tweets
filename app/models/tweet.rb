class Tweet < ActiveRecord::Base

  def self.all(user)
    user.client.home_timeline
  end

  def self.my_tweets(user)
    user.client.user_timeline(user.name)
  end

  def profile_image_url

  end

  def id

  end

  def favorited

  end

  def retweet_count

  end

  def user_screen_name

  end

  def user_name
    
  end
end
