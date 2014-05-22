ENV['RACK_ENV'] = 'test'
ENV['RAILS_ENV'] = 'test'

require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.order = "random"
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.full_backtrace = true
end
