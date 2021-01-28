# frozen_string_literal: true

module Trips
  module Waypoints
    class GeolocateOperation < ApplicationOperation
      option :address

      def call
        yield validate_contract(response_status_contract, response: response)
        yield validate_response_body

        Success(response_body)
      end

      private

      def validate_response_body
        return Success() if response_body.present?

        Failure(messages: I18n.t('.operations.geolocation_error'))
      end

      def response_body
        response.body.dig('items', 0)
      end

      def response
        @response ||= Here::APIService.new.geolocation.geocode(address: address)
      end
    end
  end
end
