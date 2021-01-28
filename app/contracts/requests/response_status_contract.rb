# frozen_string_literal: true

module Requests
  class ResponseStatusContract < ApplicationContract
    params do
      required(:response)
    end

    rule(:response) do
      key.failure(:error) unless [200, 202].include?(value.status)
    end
  end
end
