# frozen_string_literal: true

module Here
  class GeolocationService
    extend Dry::Initializer

    ENDPOINT = 'https://geocode.search.hereapi.com/v1/'

    option :api_service

    def geocode(address:)
      get(endpoint: ENDPOINT, path: 'geocode', query: { q: address })
    end

    delegate :get, to: :api_service
  end
end
