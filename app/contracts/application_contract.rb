# frozen_string_literal: true

require 'dry-validation'

class ApplicationContract < Dry::Validation::Contract
  DATE_FORMAT_REGEX = /(\d{2})-(\d{2})-(\d{4})/.freeze
  ADDRESS_FORMAT_REGEX = /[^,]+,[^,]+,[^,]+$/.freeze

  config.messages.top_namespace = 'contracts'
  config.messages.load_paths << 'config/locales/contracts.yml'
  config.messages.default_locale = :en
end
