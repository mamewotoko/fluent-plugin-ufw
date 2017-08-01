# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "fluent-plugin-ufw"
  s.version     = "0.0.1"
  s.authors     = ["Takashi Masuyama"]
  s.email       = ["mamewotoko@gmail.com"]
  s.homepage    = "http://mamewo.ddo.jp"
  s.summary     = %q{Output filter plugin to count messages that matches specified conditions}
  s.description = %q{Output filter plugin to count messages that matches specified conditions}

  s.rubyforge_project = "fluent-plugin-ufw"
# ...
  s.add_development_dependency "rake"
  s.add_runtime_dependency "fluentd"
end
