module CreditCardProcessor
  class Parser
    require 'csv'

    include BaseModule, Creation, Transaction, Summary, Presenters
    
    def initialize(attributes = {})
      set_instance_variables_from_hash(attributes)
      @card_storage = []
    end

    def parse
      return unless File.exists?(@path)
      CSV.foreach(@path) {|row| process(row[0])}
      display(summary_information(@card_storage))
    end

    private

    def process(row)
      if row[0..2].downcase == "add"
        create_card(creation_attributes(row))
      elsif row[0..5].downcase == "charge"
        charge(transaction_attributes(row))
      elsif row[0..5].downcase == "credit"
        credit(transaction_attributes(row))
      end
    end

    def create_card(attributes)
      return if !attributes || find_card(attributes[:name])
      @card_storage << @credit_card.new(attributes)
    end

    def charge(attributes)
      return unless attributes
      return unless card = find_card(attributes[:name])
      card.charge(attributes[:amount].to_i)
    end

    def credit(attributes)
      return unless attributes
      return unless card = find_card(attributes[:name])
      card.credit(attributes[:amount].to_i)
    end

    def find_card(name)
      @card_storage.find {|card| card.name.downcase == name.downcase}
    end
  end
end