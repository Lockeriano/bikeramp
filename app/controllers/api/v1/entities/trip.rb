# frozen_string_literal: true

module API
  module V1
    module Entities
      class Trip < Grape::Entity
        expose :id, documentation: { type: 'integer' }
        expose :origin, with: API::V1::Entities::Waypoint
        expose :destination, with: API::V1::Entities::Waypoint
        expose :price, documentation: { type: 'float' }
        expose :distance, documentation: { type: 'float' }
        expose :date, documentation: { type: 'string' }

        private

        delegate :distance, :price, to: :decorated_object

        def decorated_object
          TripDecorator.new(object)
        end
      end
    end
  end
end
