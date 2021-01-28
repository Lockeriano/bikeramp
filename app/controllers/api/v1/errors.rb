# frozen_string_literal: true

module API
  module V1
    module Errors
      extend ActiveSupport::Concern

      included do
        rescue_from ActiveRecord::RecordNotFound do |_e|
          response_error! I18n.t('object_not_exist'), 404
        end

        rescue_from Grape::Exceptions::ValidationErrors do |e|
          error!({ errors: { message: e.message } }, 400)
        end

        rescue_from Grape::Exceptions::InvalidMessageBody do |e|
          error!({ errors: { message: e.message } }, 400)
        end

        rescue_from ActionController::ParameterMissing do |e|
          error!({ errors: { message: e.message } }, 400)
        end

        rescue_from Dry::Validation::Failures do |e|
          error!({ errors: { message: e.message } }, 422)
        end

        rescue_from :all do |e|
          return raise e if Rails.env.development? || Rails.env.test?

          error!({ errors: "#{I18n.t('something_went_wrong')} - #{e.message.inspect}" }, 500)
        end
      end
    end
  end
end
