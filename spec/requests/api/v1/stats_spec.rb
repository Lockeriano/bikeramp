# frozen_string_literal: true

require 'rails_helper'
require 'dry/monads'

describe API::V1::Stats do
  include Dry::Monads[:result]

  let(:time_zone_now) { Time.zone.now }

  context 'GET /api/v1/monthly' do
    let(:beginning_of_month) { time_zone_now.beginning_of_month }
    let!(:trips_list_1) { create_list(:trip, 3, date: beginning_of_month, price: 10.0, distance: 10.0) }
    let!(:trips_list_2) { create_list(:trip, 2, date: beginning_of_month + 23.days, price: 15.2, distance: 15.2) }
    let!(:expected_response) do
      [
        {
          day: 'Jan, 1st',
          total_distance: '30.0 km',
          avg_ride: '10.0 km',
          avg_price: '10.0 PLN'
        },
        {
          day: 'Jan, 24th',
          total_distance: '30.4 km',
          avg_ride: '15.2 km',
          avg_price: '15.2 PLN'
        }
      ]
    end

    before { get '/api/v1/stats/monthly' }

    it do
      expect(response.body).to eq(expected_response.to_json)
    end
  end

  context 'GET /api/v1/weekly' do
    let!(:trip_1) { create(:trip, date: time_zone_now, price: 10.5, distance: 10.0) }
    let!(:trip_2) { create(:trip, date: time_zone_now, price: 13.4, distance: 25.0) }
    let!(:trip_3) { create(:trip, date: time_zone_now, price: 21.0, distance: 12.2) }
    let(:total_distance)  { Trip.all.sum(&:distance) }
    let(:total_price)     { Trip.all.sum(&:price).to_i }
    let!(:expected_response) do
      {
        total_distance: "#{total_distance} km",
        total_price: "#{total_price} PLN"
      }
    end

    before { get '/api/v1/stats/weekly' }

    it do
      expect(response.body).to eq(expected_response.to_json)
    end
  end
end
