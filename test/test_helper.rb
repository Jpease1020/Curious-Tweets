require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'webmock'
require 'vcr'




class ActiveSupport::TestCase

  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = "test/cassetts"
    config.hook_into(:webmock)
  end

end
