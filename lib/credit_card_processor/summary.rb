module CreditCardProcessor
  module Summary
    def summary_information(cards)
      cards.sort_by {|card| (card.name) }.map {|card| "#{card.name}: $#{card.balance}\n"}
    end
  end
end