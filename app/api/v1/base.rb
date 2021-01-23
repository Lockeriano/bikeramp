# frozen_string_literal: true

module Api
  module V1
    class Base < Grape::API
      include Errors

      format :json

      helpers Api::V1::Helpers::Authorization,
              Api::V1::Helpers::Headers

      mount Endpoints::Sessions::Create
      mount Endpoints::Users::Show
    end
  end
end
