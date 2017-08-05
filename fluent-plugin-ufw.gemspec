# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "fluent-plugin-ufw"
  s.version     = "0.0.3"
  s.authors     = ["Takashi Masuyama"]
  s.email       = ["mamewotoko@gmail.com"]
  s.homepage    = "https://github.com/mamewotoko/fluent-plugin-ufw"
  s.summary     = %q{Fluentd plugin to parse ufw log}
  s.description = %q{Fluentd plugin to parse ufw log}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.license       = "Apache-2.0"

  s.add_runtime_dependency "fluentd", [">= 0.12.21"]

  s.add_development_dependency "rake", [">= 0.9.2"]
  s.add_development_dependency "test-unit", [">= 1.2.3"]
  s.add_development_dependency "appraisal" 
end
