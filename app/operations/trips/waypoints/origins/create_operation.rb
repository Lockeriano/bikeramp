# frozen_string_literal: true

module Trips
  module Waypoints
    module Origins
      class CreateOperation < BaseOperation
        def call
          yield validate_contract(contract, address: address)
          yield geolocate_operation

          origin = trip.build_origin(
            address: @geolocation.success['address']['label'],
            lat: @geolocation.success['position']['lat'],
            lng: @geolocation.success['position']['lng']
          )

          Success(origin)
        end

        private

        def contract
          @contract ||= ::Trips::Waypoints::Origins::CreateContract.new
        end
      end
    end
  end
end
