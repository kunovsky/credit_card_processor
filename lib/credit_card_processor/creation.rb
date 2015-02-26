module CreditCardProcessor
  module Creation
    include Validation

    CREATION_ATTRIBUTES = [:name, :number, :limit]

    def creation_attributes(command)
      command = command.gsub("$","").split(" ").tap {|arr| arr.shift }
      return unless command.length == 3
      format_creation_attributes(command, {})
    end

    def format_creation_attributes(attributes, attributes_hash)
      CREATION_ATTRIBUTES.each {|att| attributes_hash[att]= attributes.shift }
      return attributes_hash.merge(valid: true, balance: 0) if valid_card_number?(attributes_hash[:number])
      attributes_hash.merge(valid: false, balance: "error")
    end
  end
end