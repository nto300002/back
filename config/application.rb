require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
# require "active_record/railtie"
# require "active_storage/engine"
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require "action_mailbox/engine"
# require "action_text/engine"
require 'action_view/railtie'
require 'action_cable/engine'
# require "rails/test_unit/railtie"

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.api_only = true
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    config.api_only = true

    config.exceptions_app = routes

    config.auth0 = config_for(:auth0)

    config.action_dispatch.default_headers = {
      'X-Frame-Options' => 'deny',
      'X-XSS-Protection' => '0',
      'Strict-Transport-Security' => 'max-age=31536000; includeSubDomains',
      'X-Content-Type-Options' => 'nosniff',
      'Cache-Control' => 'no-store',
      'Pragma' => 'no-cache',
      'Content-Security-Policy' => "default-src 'self', frame-ancestors 'none'"
    }
  end
end
