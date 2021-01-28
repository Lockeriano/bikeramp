# frozen_string_literal: true

module API
  module V1
    module Defaults
      extend ActiveSupport::Concern
      include Dry::Monads[:result]

      included do
        version 'v1'
        format :json
      end
    end
  end
end
