require 'fluent/plugin/parser'

module Fluent::Plugin
  class UFWParser < Parser
    # Register this parser as "time_key_value"
    Plugin.register_parser("ufw", self)
    @time_format = "%b %d %H:%M:%S"
    @pattern = /(?<time>[^ ]+ [^ ]+ [^ ]+) (?<host>[^ ]+) kernel: \[[0-9.]*\] \[(?<action>[^\]]*)\] (?<body>.*)/
#    config_param :delimiter, :string, default: " "   # delimiter is configurable with " " as default
#    config_param :time_format, :string, default: nil # time_format is configurable

    def configure(conf)
      super

      # TimeParser class is already given. It takes a single argument as the time format
      # to parse the time string with.
      @time_parser = TimeParser.new(@time_format)
    end

    def parse(text)
      m = @pattern.match(line)
      unless m
        yield nil, nil
        return
      end
      time = m['time']
      time = @time_parser.parse(time)
      host = m['host']
      action = m['action']

      record = {
        "time" => time,
        "host" => host,
        "action" => action
      }

      body = m['body']
      body.split(' ').each do |pair|
        key, value = pair.split('=',
      end
      key_values.split(@delimiter).each { |kv|
        k, v = kv.split("=", 2)
        record[k] = v
      }
      time, record = convert_values(time, record)
      yield time, record
    end
  end
end

