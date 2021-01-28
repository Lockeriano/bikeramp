# frozen_string_literal: true

module API
  class App < Grape::API
    mount V1::Base
    extend Grape::API::Helpers
  end
end
