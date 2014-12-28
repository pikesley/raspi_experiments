#!/usr/bin/env ruby

require 'pi_piper'

pin = PiPiper::Pin.new(:pin => 18, :direction => :out)

100.times do
  pin.on
  sleep 0.1 
  pin.off
  sleep 0.1 
end
