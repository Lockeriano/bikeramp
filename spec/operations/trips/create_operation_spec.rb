# frozen_string_literal: true

require 'rails_helper'

describe Trips::CreateOperation do
  include Dry::Monads[:result]

  subject { create_operation.call }

  describe '#call' do
    context 'when operation succeed' do
      let(:create_operation) { instance_double(described_class) }
      let(:trip) { instance_double(Trip) }
      let(:params) do
        {
          start_address: 'Plac Europejski 2, Warszawa, Polska',
          destination_address: 'Fabryczna 10, Kraków, Polska',
          price: 22.00,
          date: '28-01-2021'
        }
      end

      let(:expected_monad) do
        Success(trip)
      end

      it do
        allow(create_operation).to receive(:call).and_return(Success(trip))
        expect(subject).to eql(expected_monad)
      end
    end

    context 'when operation failed' do
      let(:create_operation) { described_class.new(params: params) }

      context 'without price and date' do
        let(:params) do
          {
            start_address: 'Plac Europejski 2, Warszawa, Polska',
            destination_address: 'Fabryczna 10, Kraków, Polska'
          }
        end

        let(:expected_monad) do
          Failure(
            response: {},
            errors: {
              price: ['must be filled'],
              date: ['must be filled']
            },
            messages: [
              { text: 'must be filled' },
              { text: 'must be filled' }
            ]
          )
        end

        it { expect(subject).to eql(expected_monad) }
      end
    end
  end
end
