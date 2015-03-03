# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cf/version"

Gem::Specification.new do |s|
  s.name        = "cf"
  s.version     = CF::VERSION
  s.authors     = ['Jason Snell', 'Bardan Rana']
  s.email       = ['jason.snell@cloudfactory.com", 'bardan@cloudfactory.com']
  s.homepage    = 'https://cloudfactory.com'
  s.summary     = 'Unofficial CF Gem'
  s.description = 'CloudFactory is an on-demand human workforce API'


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency "httparty"
end
