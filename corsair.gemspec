$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "corsair/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name          = "corsair"
  gem.version       = Rack::Corsair::VERSION
  gem.authors       = ["Varvet"]
  gem.email         = ["info@varvet.se"]
  gem.homepage      = "https://github.com/varvet/corsair"
  gem.summary       = ""
  gem.description   = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.7"
  gem.add_development_dependency "rake", "~> 10.0"
end
