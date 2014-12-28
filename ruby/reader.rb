#!/usr/bin/env ruby

require 'pi_piper'
include PiPiper

green = PiPiper::Pin.new pin: 17, direction: :out
red   = PiPiper::Pin.new pin: 18, direction: :out

after pin: 07, goes: :low do
  red.on
  green.off
end

after pin: 07, goes: :high do
  green.on
  red.off
end

PiPiper.wait
