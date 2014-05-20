$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hangar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hangar"
  s.version     = Hangar::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Hangar."
  s.description = "TODO: Description of Hangar."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.0"

  s.add_development_dependency "sqlite3"
end
