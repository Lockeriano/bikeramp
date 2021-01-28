# frozen_string_literal: true

module Stats
  class CalculateWeeklyOperation < ApplicationOperation
    def call
      return Failure(messages: I18n.t('operations.no_trips_in_current_week')) unless trips.any?

      Success(stats)
    end

    private

    def stats
      Stats::Weekly.new(
        total_distance: trips.sum(:distance),
        total_price: trips.sum(:price_subunit) / 100
      )
    end

    def trips
      @trips ||= ::TripsQuery::ForPeriod.call(period: period)
    end

    def period
      @period ||= ::Periods::WeekValue.new(Time.zone.now)
    end
  end
end
