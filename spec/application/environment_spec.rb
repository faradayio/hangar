RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.order = "random"
  config.full_backtrace = true
end

describe 'Application', :application do
  it 'dies when loading Hangar in non-test environment' do
    expect { Hangar }.not_to raise_error
    expect do
      ENV['RACK_ENV'] = 'production'
      ENV['RAILS_ENV'] = 'production'
      load File.expand_path("../../dummy/config/environment.rb", __FILE__)
    end.to raise_error{Hangar::BadEnvironmentError}
  end

  it 'defaults clean_strategy to deletion' do
    Hangar # oh autoload
    expect(Hangar.clean_strategy).to eq :deletion
  end
end
