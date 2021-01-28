# frozen_string_literal: true

require 'dry/monads'

module API
  module V1
    class Trips < Grape::API
      include Dry::Monads[:result]
      include API::V1::Defaults
      include API::V1::Errors

      resource :trips do
        desc 'Create a trip'
        params do
          with(allow_blank: false) do
            requires :start_address, type: String, desc: 'format: Plac Europy 2, Warszawa, Polska'
            requires :destination_address, type: String, desc: 'format: Plac Europy 2, Warszawa, Polska'
            requires :price, type: Float, desc: 'format: 19.99 (currency is PLN)'
            requires :date, type: String, desc: 'format: dd-mm-yyyy'
          end
        end
        post do
          result = ::Trips::CreateOperation.new(params: declared(params)).call

          case result
          when Success
            present result.success, with: API::V1::Entities::Trip
          when Failure
            present result.failure, with: API::V1::Entities::Error
          end
        end
      end
    end
  end
end
