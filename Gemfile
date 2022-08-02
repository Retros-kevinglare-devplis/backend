source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false
gem 'mongoid', '~> 8.0.2'
gem 'jsonapi-serializer'
gem 'mongoid_paranoia', path: 'vendor/mongoid_paranoia'

gem 'jwt'
gem 'bcrypt'

gem 'interactor', '~> 3.0'

gem 'dry-validation'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
end

group :development do; end
