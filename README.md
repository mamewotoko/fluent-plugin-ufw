# Fluent::Plugin::Ufw

A fluent plugin to parse ufw log

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fluent-plugin-ufw'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-ufw

## Manual installation

   $ cp lib/fluent/plugin/parser_ufw.rb /etc/fluent/plugin/

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

## Usage

TODO: Write usage instructions here

## Build gem

    $ gem build fluent-plugin-ufw.gemspec


## TODO
* add test
* write Usage

----
Takashi Masuyama < mamewotoko@gmail.com >  
http://mamewo.ddo.jp/

