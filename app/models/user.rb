class User < ActiveRecord::Base
  attr_reader :client

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

 # this goes into a MyTweets class
  # def self.my_tweets
  #   client.user_timeline(@user)
  # end
end

# call the TwitterService here and take just the appropriate methods form them correlating to whatever model/poro this is (Tweets, MyTweets, User, etc)
