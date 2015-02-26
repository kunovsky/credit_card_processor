require 'spec_helper'

describe CreditCardProcessor::Summary do
  
  let(:dummy_class) { Class.new { extend CreditCardProcessor::Summary } }
  let(:credit_card) { CreditCardProcessor::CreditCard }
  let(:dummy_cards) { [credit_card.new(name: 'Ty', balance: 0), credit_card.new(name: 'Adam', balance: 1000)] }
  let(:output) { ["Adam: $1000\n", "Ty: $0\n"] }

  describe '#summary_information' do
    
    it "should return a sorted array card objects mapped to strings" do
      expect(dummy_class.summary_information(dummy_cards)).to eq(output)
    end
  end
end