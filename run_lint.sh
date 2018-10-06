#! /bin/sh
set -e

bundle install
rubocop --require rubocop/formatter/checkstyle_formatter --format RuboCop::Formatter::CheckstyleFormatter --no-color -c rubocop.yml $*
