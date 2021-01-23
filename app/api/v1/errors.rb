# frozen_string_literal: true

module Api
  module V1
    module Errors
      extend ActiveSupport::Concern

      included do
        rescue_from ActiveRecord::RecordNotFound do |_e|
          error!({ message: I18n.t('object_not_exist') }, 404)
        end

        rescue_from Grape::Exceptions::ValidationErrors do |e|
          error!({ message: e.message }, 400)
        end

        rescue_from ActionController::ParameterMissing do |e|
          error!({ message: e.message }, 400)
        end

        rescue_from :all do |e|
          error!({ message: I18n.t('something_went_wrong'), details: e.message.inspect }, 500)
        end
      end
    end
  end
end
