require 'dry/monads'

class ApplicationOperation
  include Callee
  include Dry::Monads[:result, :do]

  private

  def check_errors
    return Failure(errors: errors) if errors.any?

    Success(nil)
  end

  def errors
    @errors ||= contract.call(form_data).errors.to_h
  end

  def form_data
    @form_data ||= form.to_h
  end
end
