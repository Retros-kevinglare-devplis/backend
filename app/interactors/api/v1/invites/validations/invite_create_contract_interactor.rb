class Api::V1::Invites::Validations::InviteCreateContractInteractor < ApplicationInteractor
  include Interactor::Organizer

  def call
    params = context.params
    contract = Contracts::Api::V1::Invites::CreateContract.call(params)
    return if contract.success?

    context.message = "#{self.class.name} error: #{contract.errors.to_h}"
    context.error = contract.errors.to_h
    context.status = :unprocessable_entity
    context.fail!
  end
end
