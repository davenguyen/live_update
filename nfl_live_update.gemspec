$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nfl_live_update/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nfl_live_update"
  s.version     = NFLLiveUpdate::VERSION
  s.authors     = ["Dave Nguyen"]
  s.email       = ["Dave.Nguyen@inthenight.net"]
  s.homepage    = "https://github.com/davenguyen/nfl_live_update"
  s.summary     = "Get NFL schedules and live scores through official feeds."
  s.description = "Get NFL schedules and live scores through official feeds."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
end
