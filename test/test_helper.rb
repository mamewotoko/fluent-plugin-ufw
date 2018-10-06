$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'simplecov'
SimpleCov.start
require 'fluent/plugin/parser_ufw'
require 'test/unit'
require 'fluent/test'
require 'fluent/test/driver/parser'

