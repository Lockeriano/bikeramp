# frozen_string_literal: true

module API
  module V1
    module Entities
      class Error < Grape::Entity
        expose :errors

        def errors
          object
        end
      end
    end
  end
end
