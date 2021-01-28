# frozen_string_literal: true

require 'dry-container'

module Requests
  class Container
    extend Dry::Container::Mixin

    register 'response_status_contract' do
      ResponseStatusContract.new
    end
  end
end
