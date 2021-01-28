# frozen_string_literal: true

module Trips
  module Waypoints
    module Destinations
      class CreateContract < ApplicationContract
        params do
          required(:address).filled(:string)
        end

        rule(:address) do
          key.failure(:cannot_be_nil) unless value.present?
          key.failure(:invalid_format) unless ADDRESS_FORMAT_REGEX.match?(value)
        end
      end
    end
  end
end
