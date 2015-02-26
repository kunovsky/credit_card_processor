require 'spec_helper'

describe CreditCardProcessor::Creation do

  let(:dummy_class) { Class.new { extend CreditCardProcessor::Creation } }
  let(:correct_input) { 'create tom 4111111111111111 $1000' }
  let(:correct_output) { { name: 'tom', number: '4111111111111111', limit: '1000', balance: 0, valid: true } }
  let(:incorrect_input) { 'create tom 4111111111111112 $1000' }
  let(:incorrect_output) { { name: 'tom', number: '4111111111111112', limit: '1000', balance: 'error', valid: false } }
  let(:invalid_input) { 'create tom 4111111111111112 $1000 3' }

  describe '#creation_attributes' do

    it "should return the correct card creation attributes if it is passed a valid command" do
      expect(dummy_class.creation_attributes(correct_input)).to eq(correct_output)
    end

    it "should return the invalid card creation attributes if it is passed an invalid command" do
      expect(dummy_class.creation_attributes(incorrect_input)).to eq(incorrect_output)
    end

    it "should return nil if the command is not a valid command" do
      expect(dummy_class.creation_attributes(invalid_input)).to eq(nil)
    end
  end
end