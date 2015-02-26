module CreditCardProcessor
  class UserInterface
    include Creation, Transaction, UserMessages, Summary, Presenters

    def initialize(credit_card)
      @credit_card = credit_card
      @card_storage = []
    end

    def run
      session_driver
    end

    private

    def session_driver
      display(valid_commands)
      command = command_prompt
      until command.downcase == "done"
        if command.downcase == "help"
          display(valid_commands)
        elsif command[0..2].downcase == "add"
          create_card(creation_attributes(command))
        elsif command[0..5].downcase == "charge"
          charge(transaction_attributes(command))
        elsif command[0..5].downcase == "credit"
          credit(transaction_attributes(command))
        else 
          display(invalid_command)
        end
        command = command_prompt
      end
      display(summary_information(@card_storage))
    end

    def command_prompt
      print "Enter a command:"
      gets.chomp
    end

    def create_card(attributes)
      return display(invalid_command) unless attributes
      return display(user_exists(attributes[:name])) if find_card(attributes[:name])
      @card_storage << @credit_card.new(attributes)
    end

    def charge(attributes)
      return display(invalid_command) unless attributes
      return display(invalid_user(attributes[:name])) unless card = find_card(attributes[:name])
      card.charge(attributes[:amount].to_i)
    end

    def credit(attributes)
      return display(invalid_command) unless attributes
      return display(invalid_user(attributes[:name])) unless card = find_card(attributes[:name])
      card.credit(attributes[:amount].to_i)
    end

    def find_card(name)
      @card_storage.find {|card| card.name.downcase == name.downcase}
    end
  end
end