require 'dry-validation'

class ApplicationContract < Dry::Validation::Contract
  config.messages.top_namespace = 'contracts'
  config.messages.load_paths << 'config/locales/contracts.yml'
  config.messages.default_locale = :en
end
