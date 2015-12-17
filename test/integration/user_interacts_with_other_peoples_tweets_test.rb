class UserTweetingTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :service

  def setup
    Capybara.app = CuriousTweets::Application
    stub_omniauth
    visit "/"
    assert_equal 200, page.status_code
    click_link "login"
  end

  test "user can favorite a tweet" do
    VCR.use_cassette("curious_tweets#favoriting") do
      assert_equal dashboard_path, current_path

      within(".list-group-item") do
        fill_in "tweet", with: "this is a tweet"
        click_on "Submit"
        assert page.has_content("this is a tweet")
        click_on css(".favorite")
        assert page.has_content("favorite")
      end
    end
  end

  test "user can unfavorite a tweet" do
    VCR.use_cassette("curious_tweets#favoriting") do
      assert_equal dashboard_path, current_path

      within(".list-group-item") do
        fill_in "tweet", with: "this is a tweet"
        click_on "Submit"
        assert page.has_content("this is a tweet")
        click_on css(".favorite")
        assert page.has_content("red")
        click_on css(".glyphicon-heart")
        refute page.has_content("favorite")
      end
    end
  end
end
