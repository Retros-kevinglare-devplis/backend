#!/usr/bin/env -S falcon host
# frozen_string_literal: true

load :rack

hostname = File.basename(__dir__)
HOST = "#{ENV.fetch('PROTOCOL') { 'http' }}://#{ENV.fetch('HOST') { '0.0.0.0:9292' }}".freeze

rack hostname do
  append preload 'config/preload.rb'
  endpoint Async::HTTP::Endpoint.parse(HOST).with(protocol: Async::HTTP::Protocol::HTTP11)
end
