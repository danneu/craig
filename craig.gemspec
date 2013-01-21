# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'craig/version'

Gem::Specification.new do |gem|
  gem.name          = "craig"
  gem.version       = Craig::VERSION
  gem.authors       = ["Dan Neumann"]
  gem.email         = ["danrodneu@gmail.com"]
  gem.description   = %q{a robust little Craigslist scraper that fetches listings.}
  gem.summary       = %q{a robust little Craigslist scraper.}
  gem.homepage      = "http://github.com/danneu/craig"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "nokogiri", "~> 1.5.6"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "wrong"
  gem.add_development_dependency "diff-lcs"
  gem.add_development_dependency "pry"
end
