#!/usr/bin/env ruby

require 'pi_piper'

interval = 0.02

pin_1 = PiPiper::Pin.new(:pin => 17, :direction => :out)
pin_2 = PiPiper::Pin.new(:pin => 18, :direction => :out)

1000000.times do
  pin_1.on
  sleep interval
  pin_1.off
  pin_2.on
  sleep interval
  pin_2.off
end
