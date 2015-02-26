require 'spec_helper'

describe CreditCardProcessor::CreditCard do

  let(:valid_attributes) { {name: "Ty", balance: 0, number: "4111111111111111", limit: "1000", valid: true } }
  let(:invalid_attributes) { {name: "Ty", balance: "error", number: "4111111111111112", limit: "1000", valid: false } }

  let(:valid) { CreditCardProcessor::CreditCard.new(valid_attributes) }
  let(:invalid) { CreditCardProcessor::CreditCard.new(invalid_attributes) }

  describe '#charge' do
    
    it "should only charge a card with a valid balance" do
      valid.charge(200)
      expect(valid.balance).to eq(200)

      invalid.charge(200)
      expect(invalid.balance).to eq('error')
    end

    it "should not charge a card beyond its limit" do
      valid.charge(1000)
      valid.charge(1)
      expect(valid.balance).to eq(1000)
    end
  end

  describe '#credit' do

    it "should only credit a card with a valid balance" do
      valid.credit(200)
      expect(valid.balance).to eq(-200)

      invalid.credit(200)
      expect(invalid.balance).to eq('error')
    end
  end
end