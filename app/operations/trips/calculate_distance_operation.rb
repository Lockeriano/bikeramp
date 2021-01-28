# frozen_string_literal: true

module Trips
  class CalculateDistanceOperation < ApplicationOperation
    option :origin
    option :destination

    def call
      yield validate_contract(contract, origin: origin, destination: destination)
      yield validate_contract(response_status_contract, response: response)
      yield validate_response_body

      Success(response_body).fmap { |distance| (distance / 1000.0).round(2) }
    end

    private

    def validate_response_body
      return Success() if response_body.present?

      Failure(messages: I18n.t('operations.calculate_distance_error'))
    end

    def contract
      @contract ||= ::Trips::CalculateDistanceContract.new
    end

    def response_body
      response.body.dig('response', 'route', 0, 'summary', 'distance')
    end

    def response
      @response ||= Here::APIService.new.route.calculate_distance(
        origin_position: {
          lat: origin.lat,
          lng: origin.lng
        },
        destination_position: {
          lat: destination.lat,
          lng: destination.lng
        }
      )
    end
  end
end
