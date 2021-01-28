# frozen_string_literal: true

require 'rails_helper'

describe Trips::Waypoints::Destinations::CreateOperation do
  include Dry::Monads[:result]

  subject { create_operation.call }

  let(:trip) { instance_double(Trip) }

  describe '#call' do
    context 'when operation succeed' do
      let(:create_operation) { instance_double(described_class) }
      let(:destination) { instance_double(Trip::Destination) }

      let(:expected_monad) do
        Success(destination)
      end

      it do
        allow(create_operation).to receive(:call).and_return(Success(destination))
        expect(subject).to eql(expected_monad)
      end
    end

    context 'when operation failed' do
      let(:create_operation) { described_class.new(trip: trip, address: address) }

      context 'without address' do
        let(:address) { nil }

        let(:expected_monad) do
          Failure(
            response: {},
            errors: {
              address: ['must be filled']
            },
            messages: [
              { text: 'must be filled' }
            ]
          )
        end

        it { expect(subject).to eql(expected_monad) }
      end

      context 'with invalid format' do
        let(:address) { ', Warszawa, Polska' }

        let(:expected_monad) do
          Failure(
            response: {},
            errors: {
              address: ['invalid format']
            },
            messages: [
              { text: 'invalid format' }
            ]
          )
        end

        it { expect(subject).to eql(expected_monad) }
      end
    end
  end
end
