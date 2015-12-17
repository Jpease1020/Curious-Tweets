require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :service

  def setup
    Capybara.app = CuriousTweets::Application
    @service = User.client
    # stub_omniauth
  end

  test "logging in" do
    VCR.use_cassette("curious_tweets#logs_in") do
      tweets = client.user_timeline(user.name)
      tweet = tweets.first

      assert_equal "Hi", tweet["text"]
      visit "/"
      assert_equal 200, page.status_code
      click_link "login"
      assert_equal "/", current_path
      assert page.has_content?("Justin Pease")
      assert page.has_link?("logout")
    end
  end

end


# put a pry in user.rb when the hash is comming back and capture that details
#
