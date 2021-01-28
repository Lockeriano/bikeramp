# frozen_string_literal: true

module API
  module V1
    module Entities
      module Stats
        class Weekly < Grape::Entity
          expose :total_distance
          expose :total_price

          private

          delegate :total_distance, :total_price, to: :decorated_object

          def decorated_object
            StatDecorator.new(object)
          end
        end
      end
    end
  end
end
