# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rsl/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tim Breitkreutz, Lori Olson"]
  gem.email         = ["tim@sbrew.com"]
  gem.description   = %q{Ruby scientific/statistical library}
  gem.summary       = %q{Ruby scientific/statistical library with MIT licence}
  gem.homepage      = "https://github.com/timbreitkreutz/rsl"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rsl"
  gem.require_paths = ["lib"]
  gem.version       = Rsl::VERSION
end
