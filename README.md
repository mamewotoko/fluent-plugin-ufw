# Fluent::Plugin::Ufw

A fluent plugin to parse [ufw](https://help.ubuntu.com/community/UFW) log

## Installation

```
gem build fluent-plugin-ufw.gemspec
gem install fluent-plugin-ufw
```

## Manual installation

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
* read [Interpreting Log Entries of UFW](https://help.ubuntu.com/community/UFW#Logging)


## TODO
* add test
* write Usage

## References
* [UFW](https://help.ubuntu.com/community/UFW)

----
Takashi Masuyama < mamewotoko@gmail.com >  
http://mamewo.ddo.jp/

