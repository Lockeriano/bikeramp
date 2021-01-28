# frozen_string_literal: true

module Trips
  module Waypoints
    module Destinations
      class CreateOperation < BaseOperation
        def call
          yield validate_contract(contract, address: address)
          yield geolocate_operation

          destination = trip.build_destination(
            address: @geolocation.success['address']['label'],
            lat: @geolocation.success['position']['lat'],
            lng: @geolocation.success['position']['lng']
          )

          Success(destination)
        end

        private

        def contract
          @contract ||= ::Trips::Waypoints::Destinations::CreateContract.new
        end
      end
    end
  end
end
