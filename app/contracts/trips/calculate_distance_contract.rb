# frozen_string_literal: true

module Trips
  class CalculateDistanceContract < ApplicationContract
    params do
      required(:origin)
      required(:destination)
    end

    rule(:origin) do
      key.failure(:invalid) unless value.lat.present? && value.lng.present?
    end

    rule(:destination) do
      key.failure(:invalid) unless value.lat.present? && value.lng.present?
    end
  end
end
