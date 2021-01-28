# frozen_string_literal: true

module Stats
  class CalculateMonthlyOperation < ApplicationOperation
    def call
      return Failure(messages: I18n.t('operations.no_trips_in_current_month')) unless trips.any?

      Success(stats)
    end

    private

    def stats
      [].tap do |arr|
        trips_grouped_by_date.each do |trip|
          arr.push(Stats::Monthly.new(
                     date: trip.date,
                     total_distance: trip.total_distance,
                     avg_ride: trip.avg_ride,
                     avg_price: trip.avg_price / 100
                   ))
        end
      end
    end

    def trips_grouped_by_date
      @trips_grouped ||= trips.group(:date)
                              .select('SUM(distance) as total_distance')
                              .select('AVG(price_subunit) as avg_price')
                              .select('AVG(distance) as avg_ride')
                              .select('date')
                              .order(:date)
    end

    def trips
      @trips ||= ::TripsQuery::ForPeriod.call(period: period)
    end

    def period
      @period ||= ::Periods::MonthValue.new(Time.zone.now)
    end
  end
end
