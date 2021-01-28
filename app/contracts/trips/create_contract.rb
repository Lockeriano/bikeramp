# frozen_string_literal: true

module Trips
  class CreateContract < ApplicationContract
    params do
      required(:price).filled(:float)
      required(:date).filled(:string)
    end

    rule(:price) do
      key.failure(:cannot_be_less_than_0) if value < 0.0
    end

    rule(:date) do
      key.failure(:invalid_format) unless DATE_FORMAT_REGEX.match?(value)
    end
  end
end
