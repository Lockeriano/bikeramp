# frozen_string_literal: true

class StatDecorator < ApplicationDecorator
  delegate_all

  def day
    "#{object.date.strftime('%b')}, #{object.date.day.ordinalize}"
  end

  def total_distance
    "#{object.total_distance.round(2)} km"
  end

  def total_price
    "#{object.total_price.round(2)} PLN"
  end

  def avg_ride
    "#{object.avg_ride.round(2)} km"
  end

  def avg_price
    "#{object.avg_price.round(2)} PLN"
  end
end
