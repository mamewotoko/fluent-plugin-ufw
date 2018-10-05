#! /bin/bash
set -e
bundle install
appraisal install
appraisal rake test
