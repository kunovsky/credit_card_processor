require 'spec_helper'

describe CreditCardProcessor::Validation do

  describe '#valid_card_number?' do
    let(:dummy_class) { Class.new { extend CreditCardProcessor::Validation } }
    let(:incorrect) { '1234567890123456' }
    let(:correct) { '4111111111111111' }

    it "should return false for invalid credit card numbers" do
      expect(dummy_class.valid_card_number?(incorrect)).to eq(false)
    end

    it "should return true for invalid credit card numbers" do
      expect(dummy_class.valid_card_number?(correct)).to eq(true)
    end

    it "should not care if the argument is a number or a string" do
      expect(dummy_class.valid_card_number?(correct.to_i)).to eq(true)
    end
  end
end