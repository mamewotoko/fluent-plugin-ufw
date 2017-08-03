# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "fluent-plugin-ufw"
  s.version     = "0.0.1"
  s.authors     = ["Takashi Masuyama"]
  s.email       = ["mamewotoko@gmail.com"]
  s.homepage    = "https://github.com/mamewotoko/fluent-plugin-ufw"
  s.summary     = %q{Fluentd plugin to parse ufw log}
  s.description = %q{Fluentd plugin to parse ufw log}

  s.add_development_dependency "rake"
  s.add_runtime_dependency "fluentd"
end
