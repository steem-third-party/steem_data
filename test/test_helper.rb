$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if ENV["HELL_ENABLED"] || ENV['CODECLIMATE_REPO_TOKEN']
  require 'simplecov'
  # if ENV['CODECLIMATE_REPO_TOKEN']
  #   require "codeclimate-test-reporter"
  #   SimpleCov.start CodeClimate::TestReporter.configuration.profile
  #   CodeClimate::TestReporter.start
  # else
    SimpleCov.start
  # end
  SimpleCov.merge_timeout 3600
end

require 'steem_data'
SteemData.load

require 'minitest/autorun'

# require 'webmock/minitest'
require 'yaml'
require 'pry'

if ENV["HELL_ENABLED"]
  require "minitest/hell"
  
  class Minitest::Test
    # See: https://gist.github.com/chrisroos/b5da6c6a37ac8af5fe78
    parallelize_me! unless defined? WebMock
  end
else
  require "minitest/pride"
end

class SteemData::Test < MiniTest::Test
end
