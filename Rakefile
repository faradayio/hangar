begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:application_spec) do |t|
  t.rspec_opts = '--tag application'
end
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--tag ~application'
end

task :default do
  old_spec = ENV['SPEC']
  ENV['SPEC'] = File.expand_path('../spec/application/environment_spec.rb', __FILE__)
  Rake::Task[:application_spec].execute
  ENV['SPEC'] = old_spec
  Rake::Task[:spec].execute
end
