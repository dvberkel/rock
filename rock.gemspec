require File.expand_path("../lib/rock/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "rock"
  gem.version       = Rock::VERSION
  gem.date          = "2012-08-12"
  gem.summary       = "Tantrix Rock solver"
  gem.description   = "This project solves the standard Tantrix Rock puzzle"
  gem.authors       = ["Daan van Berkel"]
  gem.email         = "daan.v.berkel.1980@gmail.com"
  gem.homepage      = "https://github.com/dvberkel/rock"

  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
