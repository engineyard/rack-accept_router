# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack-accept_router/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josh Lane"]
  gem.email         = ["lane.joshlane@gmail.com"]
  gem.description   = %q{Rack middleware to router based ACCEPT version}
  gem.summary       = %q{Rack middleware that routes requests to based on the version in the ACCEPT header and the specified route}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "rack-accept_router"
  gem.require_paths = ["lib"]
  gem.version       = Rack::AcceptRouter::VERSION
end
