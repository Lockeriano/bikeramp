# frozen_string_literal: true

module API
  module V1
    module Entities
      module Stats
        class Monthly < Grape::Entity
          expose :day
          expose :total_distance
          expose :avg_ride
          expose :avg_price

          private

          delegate :day, :total_distance, :avg_ride, :avg_price, to: :decorated_object

          def decorated_object
            StatDecorator.new(object)
          end
        end
      end
    end
  end
end
