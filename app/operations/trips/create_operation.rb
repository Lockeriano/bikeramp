# frozen_string_literal: true

module Trips
  class CreateOperation < ApplicationOperation
    attr_reader :trip, :origin, :destination

    option :params

    def call
      yield validate_contract(contract, price: params[:price], date: params[:date])

      ApplicationRecord.transaction do
        build_trip
        yield build_origin
        yield build_destination

        trip.distance = calculate_distance_operation
        trip.save
      end

      Success(trip)
    end

    private

    def contract
      @contract ||= ::Trips::CreateContract.new
    end

    def build_trip
      @trip ||= Trip.new(trip_params)
    end

    def build_origin
      @origin ||= Trips::Waypoints::Origins::CreateOperation.new(
        trip: trip,
        address: params[:start_address]
      ).call
    end

    def build_destination
      @destination ||= Trips::Waypoints::Destinations::CreateOperation.new(
        trip: trip,
        address: params[:destination_address]
      ).call
    end

    def calculate_distance_operation
      yield Trips::CalculateDistanceOperation.new(
        origin: origin.success, destination: destination.success
      ).call
    end

    def trip_params
      params.except(:start_address, :destination_address)
    end
  end
end
