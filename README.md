fluent-plugin-ufw
==================
[![Build Status](https://travis-ci.org/mamewotoko/fluent-plugin-ufw.svg?branch=master)](https://travis-ci.org/mamewotoko/fluent-plugin-ufw)

A fluent plugin to parse [ufw](https://help.ubuntu.com/community/UFW) log

## Installation
either A or B

### A. build gem file and install

```
gem build fluent-plugin-ufw.gemspec
td-agent-gem install --local fluent-plugin-ufw.gem
```

### B. copy plugin file

```
cp lib/fluent/plugin/parser_ufw.rb /etc/fluent/plugin/
```

## fluentd config
specify `format ufw` in fluent.config like example below.

```
<source>
 @type tail
 read_from_head true
 format ufw
 
 path /var/log/ufw/ufw.log*
 pos_file /var/log/ufw/ufw.pos
 tag ufw.combined
</source>
```

## Fields in log
* read [Interpreting Log Entries of UFW](https://help.ubuntu.com/community/UFW#Interpreting_Log_Entries)

## Test

```
bundle install
bundle exec rake
```

## TODO
* release gem

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

----
Takashi Masuyama < mamewotoko@gmail.com >  
http://mamewo.ddo.jp/
