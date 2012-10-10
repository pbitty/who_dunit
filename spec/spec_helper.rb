ENV['RAILS_ENV'] ||= 'test'


# Rails integration taken from:
# http://codingdaily.wordpress.com/2011/01/14/test-a-gem-with-the-rails-3-stack/

require 'action_controller/railtie'
require 'rails/test_unit/railtie'

root = File.expand_path(File.dirname(__FILE__))

# Application config
module Test
  class Application < ::Rails::Application
    # config happens here
    config.active_support.deprecation = :stderr
  end
end

# Initialize the app
Test::Application.initialize!

require 'rspec/rails'

RSpec.configure do |config|
  # Rspec config here
end

require 'supermodel'
require 'who_dunit'