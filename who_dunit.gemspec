# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "who_dunit/version"

Gem::Specification.new do |s|
  s.name        = "who_dunit"
  s.version     = WhoDunit::VERSION
  s.authors     = ["Paulo Bittencourt"]
  s.email       = ["pbitty@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Tracks saves creator and updater of ActiveRecord model in Rails}
  s.description = %q{Keeps track of current user in Rails controller actions, making current user available to ActiveRecord callbacks. }

  s.rubyforge_project = "who_dunit"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'supermodel'
  s.add_development_dependency 'actionpack', '~> 3.0'
  s.add_development_dependency 'railties', '~> 3.0'
end