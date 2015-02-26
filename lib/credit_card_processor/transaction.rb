module CreditCardProcessor
  module Transaction
    TRANSACTION_INFO = [:name, :amount]

    def transaction_attributes(command)
      command = command.gsub("$","").split(" ").tap {|arr| arr.shift }
      return unless command.length == 2
      format_transaction_attributes(command)
    end

    def format_transaction_attributes(attributes)
      {}.tap { |attributes_hash| TRANSACTION_INFO.each {|att| attributes_hash[att]= attributes.shift } }
    end
  end
end