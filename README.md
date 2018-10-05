fluent-plugin-ufw [![Build Status](https://travis-ci.org/mamewotoko/fluent-plugin-ufw.svg?branch=master)](https://travis-ci.org/mamewotoko/fluent-plugin-ufw) [![Gem Version](https://badge.fury.io/rb/fluent-plugin-ufw.svg)](https://badge.fury.io/rb/fluent-plugin-ufw)
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
### A. Using installed fluetntd

```
bundle install
bundle exec rake
```

### B. Multiple version of fluentd with appraisal tool

```
bundle install
appraisal install
appraisal rake test
```

### C. Install gem and run with fluentd as docker container

Run for fluentd version specified in Dockerfile

```
sh run_docker_test.sh
```

Run for multiple fluentd version

```
sh run_docker_test.sh
```

## Install for development
### A. build gem file and install

```
bundle exec rake build
gem install --local pkg/fluent-plugin-ufw-0.0.1.gem
```

### B. copy plugin file

```
cp lib/fluent/plugin/parser_ufw.rb /etc/fluent/plugin/
```

## Vagrant
Vagranfile is to run virtual box vm to build and test gem

```
vagrant up
```

## License

```
Copyright (c) 2017 Takashi Masuyama. All rights reserved.

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
