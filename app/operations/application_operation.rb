# frozen_string_literal: true

require 'dry/monads'

class ApplicationOperation
  extend Dry::Initializer

  include Dry::Monads[:result, :do]
  include Requests::Import['response_status_contract']

  private

  def validate_contract(contract, **args)
    result = contract.call(args)

    if result.errors.any?
      Failure(
        response: { status: args[:response]&.status, body: args[:response]&.body }.compact,
        errors: result.errors.to_h,
        messages: result.errors.map { |message| { text: message.text } }
      )
    else
      Success()
    end
  end
end
