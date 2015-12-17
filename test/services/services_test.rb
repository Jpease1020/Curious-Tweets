require './test/test_helper'

class CuriousTweetsServiceTest < ActiveSupport::TestCase
  attr_reader :client, :user
  def setup
    @user = OpenStruct.new(oauth_token: ENV["oauth_token"], oauth_token_secret: ENV["oauth_token_secret"])
    @client = User.new.client
  end


  test "#tweet streem" do
    VCR.use_cassette("curious_tweets#my_tweets") do
      tweets = client.user_timeline(user.name)
      tweet = tweets.first

      assert_equal "Hi", tweet["text"]
    end
  end
end
