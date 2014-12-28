#!/usr/bin/env ruby

require 'pi_piper'
include PiPiper

pin = PiPiper::Pin.new(:pin => 18, :direction => :out)

after :pin => 07, :goes => :low do
  pin.on
end

after :pin => 07, :goes => :high do
  pin.off
end

PiPiper.wait
