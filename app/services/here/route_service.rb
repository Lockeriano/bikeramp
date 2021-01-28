# frozen_string_literal: true

module Here
  class RouteService
    extend Dry::Initializer

    ENDPOINT = 'https://route.ls.hereapi.com/routing/7.2/'

    option :api_service

    def calculate_distance(origin_position:, destination_position:)
      body = {
        mode: 'fastest;bicycle;traffic:disabled',
        waypoint0: "geo!#{origin_position[:lat]},#{origin_position[:lng]}",
        waypoint1: "geo!#{destination_position[:lat]},#{destination_position[:lng]}"
      }

      get(endpoint: ENDPOINT, path: 'calculateroute.json', query: body)
    end

    delegate :get, to: :api_service
  end
end
