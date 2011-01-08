# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tail_from_sentinel/version"

Gem::Specification.new do |s|
  s.name        = "tail_from_sentinel"
  s.version     = TailFromSentinel::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jason Stirk"]
  s.email       = ["jstirk@oobleyboo.com"]
  s.homepage    = ""
  s.homepage    = "http://github.com/jstirk/tail_from_sentinel"
  s.summary     = "Reads a file, but only return content once a marker (sentinel) has been found."
  s.description = "Reads a file, but only return content once a marker (sentinel) has been found."

  s.rubyforge_project = "tail_from_sentinel"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
