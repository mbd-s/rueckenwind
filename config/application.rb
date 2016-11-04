require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rueckenwind
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.action_mailer.default_url_options = { scheme: 'http://', host: 'localhost', port: ':3000' }
    config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.permissions = {
      "admin" => {
        "orders": ["index", "show", "new", "create", "edit", "update", "destroy"],
        "events": ["index", "show"],
        "donations": ["index", "show", "new", "create", "edit", "update", "destroy"],
        "invitations": ["index", "show", "new", "create", "edit", "update", "destroy"],
        "pickups": ["index", "show", "new", "create", "edit", "update", "destroy"],
        "welcome": ["index"],
        "users": ["index", "new", "create"]
      },
      "organizer" => {
        "orders": ["index", "show", "new", "create", "edit", "update", "destroy"],
        "events": ["index", "show", "new", "create", "edit", "update", "destroy"],
        "donations": ["index", "show", "new", "create", "edit", "update", "destroy"],
        "invitations": ["index", "show", "new", "create", "edit", "update", "destroy"],
        "pickups": ["index", "show", "new", "create", "edit", "update", "destroy"],
        "users": ["index"]
      },
      "volunteer" => {
        "orders": [],
        "events": ["show"],
        "donations": [],
        "invitations": [],
        "pickups": [],
        "users": []
      }
    }
  end
end
