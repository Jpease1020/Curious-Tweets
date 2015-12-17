require 'simplecov'
SimpleCov.start("rails")

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'webmock'
require 'vcr'

class ActiveSupport::TestCase
  VCR.configure do |config|
    config.cassette_library_dir = "test/vcr_cassettes"
    config.hook_into :webmock
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
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
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def user
    @user = OpenStruct.new(oauth_token: ENV["oauth_token"], oauth_token_secret: ENV["oauth_token_secret"])
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
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

end
