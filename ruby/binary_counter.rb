#!/usr/bin/env ruby

require 'sinatra'
require 'pi_piper'

class Flasher < Sinatra::Base
  @@pins = [
    PiPiper::Pin.new(pin: 22, direction: :out),
    PiPiper::Pin.new(pin: 18, direction: :out),
    PiPiper::Pin.new(pin: 17, direction: :out),
    PiPiper::Pin.new(pin: 4, direction: :out)
  ]

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
    pattern = ("%04b" % number)[0...4]

    pattern.length.times do |index|
      i = index - 1
      @@pins[i].on if pattern[i] == '1'
      @@pins[i].off if pattern[i] == '0'
    end

    pattern
  end

  run! if app_file == $0
end
