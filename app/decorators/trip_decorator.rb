# frozen_string_literal: true

class TripDecorator < ApplicationDecorator
  delegate_all

  def price
    "#{object.price.to_f} #{object.price.currency}"
  end

  def distance
    "#{object.distance} km"
  end
end
