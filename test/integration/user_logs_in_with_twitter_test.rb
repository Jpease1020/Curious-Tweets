require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = CuriousTweets::Application
    stub_omniauth
  end

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          uid: "1234",
          name: "Justin Pease",
          screen_name: "Justin Pease",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "login"
    assert_equal "/", current_path
    assert page.has_content?("Justin Pease")
    assert page.has_link?("logout")
  end

end
