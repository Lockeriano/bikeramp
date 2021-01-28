# frozen_string_literal: true

require 'dry/monads'

module API
  module V1
    class Stats < Grape::API
      include Dry::Monads[:result]
      include API::V1::Defaults
      include API::V1::Errors

      resource :stats do
        get 'weekly' do
          result = ::Stats::CalculateWeeklyOperation.new.call

          case result
          when Success
            present result.success, with: API::V1::Entities::Stats::Weekly
          when Failure
            present result.failure, with: API::V1::Entities::Error
          end
        end

        get 'monthly' do
          result = ::Stats::CalculateMonthlyOperation.new.call

          case result
          when Success
            present result.success, with: API::V1::Entities::Stats::Monthly
          when Failure
            present result.failure, with: API::V1::Entities::Error
          end
        end
      end
    end
  end
end
