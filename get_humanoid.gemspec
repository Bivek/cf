# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "get_humanoid/version"

Gem::Specification.new do |s|
  s.name        = "get_humanoid"
  s.version     = GetHumanoid::VERSION
  s.authors     = ["Jason Snell"]
  s.email       = ["jason@gethumanoid.com"]
  s.homepage    = "https://gethumanoid.com"
  s.summary     = %q{Official Humanoid Gem}
  s.description = %q{Humanoid is an on-demand human workforce API}

  s.rubyforge_project = "get_humanoid"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"

  s.add_runtime_dependency "httparty"
end
