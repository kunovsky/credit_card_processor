module CreditCardProcessor
  class CreditCard
    include BaseModule

    attr_reader :name, :balance

    def initialize(attributes = {})
      set_instance_variables_from_hash(attributes)
    end

    def charge(amount)
      return unless @valid
      @balance+=amount if @balance+amount <= @limit.to_i
    end

    def credit(amount)
      return unless @valid
      @balance-=amount
    end
  end
end