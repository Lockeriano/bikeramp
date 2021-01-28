# frozen_string_literal: true

module Here
  class APIService
    extend Dry::Initializer

    def geolocation
      @geolocation ||= GeolocationService.new(api_service: self)
    end

    def route
      @route ||= RouteService.new(api_service: self)
    end

    def get(endpoint:, path:, query: {})
      request(method: :get, endpoint: endpoint, path: path, query: query)
    end

    def request(method:, endpoint:, path:, query: {}, body: '', headers: {})
      response(method: method, endpoint: endpoint, path: path, query: query, body: body, headers: headers)
    end

    def response(method:, endpoint:, path:, query: {}, body: '', headers: {})
      connection(endpoint).send(method, path) do |request|
        request.body = body
        request.params = query.merge(size: 5, outputSchema: 'basic', apiKey: token, async: false)
      end
    end

    def connection(endpoint)
      ::Faraday.new(url: endpoint) do |builder|
        builder.request :json
        builder.response :json
        builder.adapter :net_http
        builder.options[:open_timeout] = 10
        builder.options[:timeout] = 10
      end
    end

    def token
      Rails.application.credentials.here[:api_key]
    end
  end
end
