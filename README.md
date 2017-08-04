# fluent-plugin-ufw

A fluent plugin to parse [ufw](https://help.ubuntu.com/community/UFW) log

## Installation

    $ gem install fluent-plugin-ufw

## Manual installation
### A. 

   $ gem build fluent-plugin-ufw.gemspec
   $ td-agent-gem install --local fluent-plugin-ufw.gem

### B. copy plugin file

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

## TODO
* add test
* write Usage

## References
* [UFW](https://help.ubuntu.com/community/UFW)

----
Takashi Masuyama < mamewotoko@gmail.com >  
http://mamewo.ddo.jp/

