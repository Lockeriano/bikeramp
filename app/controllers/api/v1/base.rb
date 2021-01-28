# frozen_string_literal: true

require 'grape-swagger'
require 'dry/monads'

module API
  module V1
    class Base < Grape::API
      mount API::V1::Trips
      mount API::V1::Stats

      add_swagger_documentation \
        add_version: true,
        array_use_braces: true,
        mount_path: '/swagger_doc_v1',
        info: {
          title: 'Bikeramp - API v1',
          description: 'REST JSON API'
        }
    end
  end
end
