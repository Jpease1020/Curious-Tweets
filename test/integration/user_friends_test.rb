class UserFriendsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :service

  def setup
    Capybara.app = CuriousTweets::Application
    stub_omniauth
    visit "/"
    assert_equal 200, page.status_code
    click_link "login"
  end

  test "user can unfollow a user" do
    VCR.use_cassette("curious_tweets#favoriting") do
      assert_equal dashboard_path, current_path
      visit friends_path
      within(".friends-panel") do
        assert_equal 12, User.friends.count
        first(link: "Unfollow").click
        assert_equal 11. User.friends.count
      end
    end
  end
end