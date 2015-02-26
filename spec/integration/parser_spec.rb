require 'spec_helper'

describe CreditCardProcessor::Parser do

  let(:credit_card) { CreditCardProcessor::CreditCard }
  let(:attributes) { { path: 'spec/fixtures/dummy_data.csv', credit_card: credit_card } }
  let(:parser) { CreditCardProcessor::Parser.new(attributes) }

  describe '#parse' do
    it "should correctly parse and process a file of credit card transactions" do
      expect { parser.parse }.to output("Lisa: $-93\nQuincy: $error\nTom: $500\n").to_stdout
    end
  end
end