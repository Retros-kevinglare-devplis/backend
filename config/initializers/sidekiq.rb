Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/1' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/1' }
end

# Sidekiq.configure_server do |config|
#   config.redis = Async::Redis::Client.new(Async::IO::Endpoint.tcp('redis', 6379))
# end
#
# Sidekiq.configure_client do |config|
#   config.redis = Async::Redis::Client.new(Async::IO::Endpoint.tcp('redis', 6379))
# end
