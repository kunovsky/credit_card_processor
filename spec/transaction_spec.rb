require 'spec_helper'

describe CreditCardProcessor::Transaction do

  let(:dummy_class) { Class.new { extend CreditCardProcessor::Transaction } }
  let(:correct_input) { 'charge tom $1000' }
  let(:correct_output) { { name: 'tom', amount: '1000'} }
  let(:invalid_input) { 'charge tom $1000 3' }

  describe '#transaction_attributes' do
    it "should return a hash with name and amount if it is passed a valid command" do
      expect(dummy_class.transaction_attributes(correct_input)).to eq(correct_output)
    end

    it "should return nil if the command is not a valid command" do
      expect(dummy_class.transaction_attributes(invalid_input)).to eq(nil)
    end
  end
end