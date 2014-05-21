$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hangar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hangar"
  s.version     = Hangar::VERSION
  s.authors     = ["Andy Rossmeissl"]
  s.email       = ["andy@rossmeissl.net"]
  s.homepage    = "http://github.com/faradayio/hangar"
  s.summary     = "Use Rails factories from your frontend"
  s.description = "Exposes routes (in the test environment only!) that allow your frontend to factory objects and clear them between tests"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.0"
end
