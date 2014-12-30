#!/usr/bin/env ruby

require 'sinatra'
require 'pi_piper'

class Flasher < Sinatra::Base
  @@pins = [ 4, 17, 18, 22, 25 ].map { |v| PiPiper::Pin.new(pin: v, direction: :out) }

  get '/' do
    'Hello'
  end
  
  get '/on' do
    binarise 31
  end

  get '/off' do
    binarise 0
  end

  get /([0-9]+)/ do
    binarise params[:captures].first
  end

  def binarise number
    pattern = ("%08b" % number).split('').reverse[0...@@pins.count].reverse

    pattern.length.times do |index|
      i = index - 1
      @@pins[i].on if pattern[i] == '1'
      @@pins[i].off if pattern[i] == '0'
    end

    pattern
  end

  run! if app_file == $0
end
