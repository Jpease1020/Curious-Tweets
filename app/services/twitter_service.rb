class TwitterService
  attr_reader :client
    def initialize(user)
        @client ||= Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV['twitter_key']
          config.consumer_secret     = ENV['twitter_secret']
          config.access_token        = user.oauth_token
          config.access_token_secret = user.oauth_token_secret
        end
    end

    def user_info
      client.user
    end

    def dashboard_tweets

    end

    def dashboard_tweet(id)

    end

    def my_tweets

    end

    def my_tweet(id)

    end

    
    # build out the mehtods in here then apss them over to models/poros
end
