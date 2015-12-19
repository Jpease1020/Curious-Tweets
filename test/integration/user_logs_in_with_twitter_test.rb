require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "logging in" do
    VCR.use_cassette("curious_tweets#logs_in") do
      visit "/"
      assert_equal 200, page.status_code
      click_link "login"
      assert_equal "/", current_path
      assert page.has_content?("Justin Pease")
      assert page.has_link?("logout")
    end
  end
end
