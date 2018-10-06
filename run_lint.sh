#! /bin/sh
set -e

gem install rubocop rubocop-checkstyle_formatter
rubocop --require rubocop/formatter/checkstyle_formatter --format RuboCop::Formatter::CheckstyleFormatter --no-color -c rubocop.yml $*
