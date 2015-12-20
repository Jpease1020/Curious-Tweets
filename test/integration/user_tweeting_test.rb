class UserTweetingTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :service

  test "user can submit a tweet" do
    VCR.use_cassette("curious_tweets#submit") do
      visit "/"
      assert_equal 200, page.status_code
      click_link "login"
      assert_equal dashboard_path, current_path
      within("#send-a-tweet") do
        fill_in "tweet", with: "this is a tweet"
        click_on "Tweet This!"
        assert page.has_content?("this is a tweet")
      end
    end
  end

  test "user can delete a tweet" do
    VCR.use_cassette("curious_tweets#delete") do
      visit "/"
      assert_equal 200, page.status_code
      click_link "login"

      assert_equal dashboard_path, current_path
      within("#send-a-tweet") do
        fill_in "tweet", with: "this is a tweet"
        click_on ""
        within("#my-tweets")
        click_on css(".glyphicon-trash")
        refute page.has_content?("this is a tweet")
      end
    end
  end
end
