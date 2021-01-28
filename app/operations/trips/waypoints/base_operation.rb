# frozen_string_literal: true

module Trips
  module Waypoints
    class BaseOperation < ApplicationOperation
      option :trip
      option :address

      private

      def geolocate_operation
        @geolocation ||= Trips::Waypoints::GeolocateOperation.new(address: address).call
      end
    end
  end
end
