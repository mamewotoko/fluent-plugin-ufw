fluent-plugin-ufw [![Build Status](https://travis-ci.org/mamewotoko/fluent-plugin-ufw.svg?branch=master)](https://travis-ci.org/mamewotoko/fluent-plugin-ufw) [![Gem Version](https://badge.fury.io/rb/fluent-plugin-ufw.svg)](https://badge.fury.io/rb/fluent-plugin-ufw) [![Maintainability](https://api.codeclimate.com/v1/badges/2806b8f5f36bcaaf182e/maintainability)](https://codeclimate.com/github/mamewotoko/fluent-plugin-ufw/maintainability)
==================

A [fluent](https://www.fluentd.org/) plugin to parse [ufw](https://help.ubuntu.com/community/UFW) log

## Installation

```
gem install fluent-plugin-ufw
```

## fluentd config
specify `format ufw` in fluent.config like example below.

```
<source>
 @type tail
 read_from_head true
 format ufw
 
 path /var/log/ufw/ufw.log
 pos_file /var/log/ufw/ufw.pos
 tag ufw.combined
</source>
```

## Fields in log
* read [Interpreting Log Entries of UFW](https://help.ubuntu.com/community/UFW#Interpreting_Log_Entries)

## Test
### Overview

Test tool

* a. unit-test
* b. appraisal
* c. manual

Test environment

* A. local pc
* B. Vagrant VirtualBox VM (`ubuntu/xenial64`)
* C. Docker

### a. unit-test

```
bundle install
bundle exec rake
```

### b. Multiple version of fluentd with appraisal tool

```
bundle install
appraisal install
appraisal rake test
```

### c. Install gem as fluentd plugin (manual test)
1. build and install gem

```
bundle exec rake build
gem install --local pkg/fluent-plugin-ufw-0.0.4.gem
```

2. write td-agent.conf

sample

```
<source>
  @type tail
  time_key time
  read_from_head true
  format ufw
 
  path /var/log/ufw.log
  pos_file /var/log/td-agent/ufw.pos
  tag ufw.combined
</source>

<match ufw.*>
  @type file
  path /var/log/td-agent/ufw.output
  append true
  flush_interval 5s
  time_slice_format %Y%m%d
  time_slice_wait 10m
  time_format %Y%m%dT%H%M%S%z
</match>
```

3. restart td-agent and check output

### a. local pc (ubuntu/debian)

```
sudo apt-get update
sudo apt-get install -y ruby git ruby-bundler ruby-dev
curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent3.sh | sh

# clone this source using git

bundle exec rake build
gem install --local pkg/fluent-plugin-ufw-0.0.4.gem

```

### b. Vagrant

[Vagrantfile](Vagrantfile) is to run virtual box vm to build and test gem

1. prepare 

```
vagrant up
```

2. login to vm

```
vagrant ssh
cd /vagrant
```

3. run test

### c. docker container

Build image for fluentd version specified in Dockerfile

```
docker-compose build
```

Then, run test run_test.sh or run_appraisal.sh

```
docker-compose run builder ./run_test.sh
```

## License

```
Copyright (c) 2017-2018 Takashi Masuyama. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

## References
* [UFW](https://help.ubuntu.com/community/UFW)
* [test-unit](https://test-unit.github.io/)
* [thoughtbot/appraisal](https://github.com/thoughtbot/appraisal)

----
Takashi Masuyama < mamewotoko@gmail.com >  
https://mamewo.ddo.jp/
