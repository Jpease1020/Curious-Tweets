require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'webmock'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
  config.before_record do |r|
    r.request.headers.delete('Authorization')
  end
end

class ActiveSupport::TestCase

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          uid: "338656919",
          name: "Justin Pease",
          screen_name: "JustinPease",
        }
      },
      credentials: {
        token: ENV["oauth_token"],
        secret: ENV["oauth_token_secret"]
      }
    })
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = CuriousTweets::Application
    stub_omniauth
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          uid: "338656919",
          name: "Justin Pease",
          screen_name: "JustinPease",
        }
      },
      credentials: {
        token: ENV["oauth_token"],
        secret: ENV["oauth_token_secret"]
      }
    })
  end

end
