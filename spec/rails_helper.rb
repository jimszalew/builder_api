require 'simplecov'
SimpleCov.start 'rails'

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# def stub_omniauth
#   OmniAuth.config.test_mode = true
#   OmniAuth.config.mock_auth[:twitch] = OmniAuth::AuthHash.new(
#     {"provider"=>"twitch",
#     "uid"=>174211011,
#     "info"=>
#       {"name"=>"jimszalewski",
#        "email"=>"jim.szalewski@gmail.com",
#        "nickname"=>"jimszalewski",
#        "description"=>nil,
#        "image"=>nil,
#        "urls"=>{"Twitch"=>"http://www.twitch.tv/jimszalewski"}},
#      "credentials"=>
#       {"token"=>ENV["TEST_TOKEN"],
#        "expires"=>false},
#      "extra"=>
#       {"raw_info"=>
#         {"display_name"=>"jimszalewski",
#          "_id"=>174211011,
#          "name"=>"jimszalewski",
#          "type"=>"user",
#          "bio"=>nil,
#          "created_at"=>"2017-09-15T00:56:52Z",
#          "updated_at"=>"2017-11-03T01:16:19Z",
#          "logo"=>nil,
#          "_links"=>{"self"=>"https://api.twitch.tv/kraken/users/jimszalewski"},
#          "email"=>"jim.szalewski@gmail.com",
#          "partnered"=>false,
#          "notifications"=>{"push"=>true, "email"=>true}}}})
# end
