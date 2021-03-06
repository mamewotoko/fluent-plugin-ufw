$LOAD_PATH.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name = 'fluent-plugin-ufw'
  s.version = '0.0.5'
  s.authors = ['Takashi Masuyama']
  s.email = ['mamewotoko@gmail.com']
  s.homepage = 'https://github.com/mamewotoko/fluent-plugin-ufw'
  s.summary = 'Fluentd plugin to parse ufw log'
  s.description = 'Fluentd plugin to parse ufw log'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- test/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.license = 'Apache-2.0'

  s.add_runtime_dependency 'fluentd', ['>= 0.14.0', '< 2']

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-checkstyle_formatter'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'test-unit', ['>= 2.4.3']
end
