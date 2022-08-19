#!/usr/bin/env -S falcon host
# frozen_string_literal: true

load :rack

hostname = File.basename(__dir__)
HOST = ENV.fetch('HOST').freeze

rack hostname do
  endpoint Async::HTTP::Endpoint.parse(HOST).with(protocol: Async::HTTP::Protocol::HTTP11)
end
