#!/usr/bin/env -S falcon host
# frozen_string_literal: true

load :rack

hostname = File.basename(__dir__)
# HOST = "#{ENV.fetch('PROTOCOL')}://#{ENV.fetch('HOST')}".freeze
HOST='http://localhost:9292'
rack hostname do
  append preload 'config/preload.rb'
  cache true
  endpoint Async::HTTP::Endpoint.parse(HOST)
                                .with(protocol: Async::HTTP::Protocol::HTTP11)
end
