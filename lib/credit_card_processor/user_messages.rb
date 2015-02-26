module CreditCardProcessor
  module UserMessages
    def valid_commands
      "Valid Commands: add, charge, credit, done, help\n"
    end

    def invalid_command
      "Enter a valid command or type help to see a list of command options.\n"
    end

    def invalid_user(user_name)
      "User #{user_name} does not exist. You must create a card for them first\n"
    end

    def user_exists(user_name)
      "A user with the name of '#{user_name}' already exists.\n"
    end
  end
end