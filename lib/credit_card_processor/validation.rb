module CreditCardProcessor
  module Validation
    def valid_card_number?(number)
      sum1 = sum2 = 0
      number.to_s.reverse.chars.each_slice(2) do |odd, even|
        sum1 += odd.to_i
     
        double = even.to_i * 2
        double -= 9 if double >= 10
        sum2 += double
      end
      (sum1 + sum2) % 10 == 0
    end
  end
end