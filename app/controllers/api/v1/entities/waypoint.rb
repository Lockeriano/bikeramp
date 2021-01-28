# frozen_string_literal: true

module API
  module V1
    module Entities
      class Waypoint < Grape::Entity
        expose :address, documentation: { type: 'string' }
      end
    end
  end
end
