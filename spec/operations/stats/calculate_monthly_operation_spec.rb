# frozen_string_literal: true

require 'rails_helper'

describe Stats::CalculateMonthlyOperation do
  include Dry::Monads[:result]

  subject { calculate_operation.call }

  describe '#call' do
    context 'when operation succeed' do
      let(:calculate_operation) { instance_double(described_class) }
      let!(:trips_list) { create_list(:trip, 3, date: Time.zone.now, price: 10.0, distance: 10.0) }
      let(:stats) { instance_double(Stats::Monthly) }

      let(:expected_monad) do
        Success([stats, stats, stats])
      end

      it do
        allow(calculate_operation).to receive(:call).and_return(expected_monad)
        expect(subject).to eql(expected_monad)
      end
    end

    context 'when operation failed' do
      let(:calculate_operation) { described_class.new }

      context 'without any trips in period' do
        let(:expected_monad) do
          Failure(messages: I18n.t('operations.no_trips_in_current_month'))
        end

        it { expect(subject).to eql(expected_monad) }
      end
    end
  end
end
