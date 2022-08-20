source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
# gem 'puma', '~> 5.0'
gem 'falcon'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false
gem 'rack-cors'
gem 'jsonapi-serializer'
gem 'interactor', '~> 3.0'
gem 'dry-validation'

gem 'anycable-rails'
gem 'redis'
gem 'async-redis'
gem 'sidekiq', '>= 6.5.1'

gem 'mongoid', '>= 6.0', '< 8.a'
gem 'mongoid_paranoia'
gem 'enumerize'

gem 'jwt'
gem 'bcrypt'

gem 'newrelic_rpm'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
end

group :development do; end
