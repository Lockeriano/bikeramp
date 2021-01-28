# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bikeramp
  class Application < Rails::Application
    config.time_zone = 'Warsaw'
    config.load_defaults 6.0
    config.autoload_paths << Rails.root.join('app/services/**/')
    config.autoload_paths << Rails.root.join('app/queries/**/')
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.api_only = true
    config.i18n.available_locales = ['en']
    config.i18n.default_locale = :en
    config.active_record.default_timezone = :local
  end
end
