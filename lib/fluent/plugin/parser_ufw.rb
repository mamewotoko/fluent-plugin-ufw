require 'fluent/plugin/parser'

module Fluent
  module Plugin
    # fluent-plugin-ufw main class
    class UFWParser < Parser
      # Register this parser as 'time_key_value'
      Fluent::Plugin.register_parser('ufw', self)

      def configure(conf)
        super
        @time_format = '%b %d %H:%M:%S'
        @pattern = /(?<time>[^ ]+ +[^ ]+ [^ ]+) (?<host>[^ ]+) kernel: \[[0-9. ]*\] \[(?<action>[^\]]*)\] (?<body>.*)/

        # $log.info 'ufw is configured'
        # TimeParser class is already given.
        # It takes a single argument as the time format
        # to parse the time string with.
        @time_parser = TimeParser.new(@time_format)
        @mutex = Mutex.new
      end

      def parse(text)
        # $log.info "parse called: $text"
        m = @pattern.match(text)
        unless m
          yield nil, nil
          return
        end
        time = m['time']
        time = @mutex.synchronize { @time_parser.parse(time) }
        host = m['host']
        action = m['action']

        record = {
          'host' => host,
          'action' => action
        }

        body = m['body']
        body.split(' ').each do |pair|
          key, value = pair.split('=', 2)
          record[key] = value
        end
        record['time'] = m['time'] if @keep_time_key

        yield time, record
      end
    end
  end
end
