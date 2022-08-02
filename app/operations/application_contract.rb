class ApplicationContract < Dry::Validation::Contract
  def self.call(*args)
    new.call(*args)
  end
end
