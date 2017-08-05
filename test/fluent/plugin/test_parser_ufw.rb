require 'test_helper'

class UFWTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
    
    @parser = Fluent::Test::ParserTestDriver.new(Fluent::TextParser::UFWParser).configure({})
    @expected = {
      'host' => 'hostnm',
      'action' => 'UFW BLOCK',
      'IN' => 'br-9e24f5d888e0',
      'OUT' => "",
      'PHYSIN' => 'veth9f1178d',
      'MAC' => '02:42:e1:a2:93:db:02:42:ac:13:00:02:08:00',
      'SRC' => '172.19.0.2',
      'DST' => '172.19.0.1',
      'LEN' => '40',
      'TOS' => '0x00',
      'PREC' => '0x00',
      'TTL' => '64',
      'ID' => '38516',
      'DF' => nil,
      'PROTO' => 'TCP',
      'SPT' => '7777',
      'DPT' => '49338',
      'WINDOW' => '0',
      'RES' => '0x00',
      'RST' => nil,
      'URGP' => '0'
    }
  end

  def test_parse
    @parser.instance.parse('Aug  1 19:03:54 hostnm kernel: [341682.476244] [UFW BLOCK] IN=br-9e24f5d888e0 OUT= PHYSIN=veth9f1178d MAC=02:42:e1:a2:93:db:02:42:ac:13:00:02:08:00 SRC=172.19.0.2 DST=172.19.0.1 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=38516 DF PROTO=TCP SPT=7777 DPT=49338 WINDOW=0 RES=0x00 RST URGP=0 ') { |time, record|
      expected_time = Time.strptime('1/Aug 19:03:54', '%d/%b %H:%M:%S')
      assert_equal(expected_time.to_i, time.to_i)
      assert_equal(@expected, record)
    }
  end
    
end
