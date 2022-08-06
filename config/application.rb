require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Retrosprint
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true

    config.time_zone = 'Europe/Moscow'
    config.active_job.queue_adapter = :sidekiq

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { host: ENV['HOST'], protocol: ENV['PROTOCOL'] }
    config.action_mailer.smtp_settings = {
      :address              => 'smtp.gmail.com"',
      :port                 => 587,
      :user_name            => ENV['EMAIL_USERNAME'],
      :password             => ENV['EMAIL_PASSWORD'],
      :authentication       => 'plain',
      :enable_starttls_auto => true
    }
  end
end
