=begin

The Greek mathematician Nicomachus devised a classification scheme for natural numbers (1, 2, 3, ...), identifying each as belonging uniquely to the categories of abundant, perfect, or deficient based on a comparison between the number and the sum of its positive divisors (the numbers that can be evenly divided into the target number with no remainder, excluding the number itself). For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

    Perfect numbers have an Aliquot sum that is equal to the original number.
    Abundant numbers have an Aliquot sum that is greater than the original number.
    Deficient numbers have an Aliquot sum that is less than the original number.

Examples:

    6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
    28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
    15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
    24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
    Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

Write a program that can tell whether a number is perfect, abundant, or deficient.

=end

=begin
P 

input: number
output: perfection status

rules:
- a perfect number is a number that is the sum of all of its divisors
- an abundant number is a number where the sum of all divisors is greater than the number itself
- a deficient number is the opposite of abundant, all divisors summed equals a lesser number than the base number

- prime numbers always deficient, only divisor is 1
- so (obv) the given number doesn't count as a divisor


Data-flow

Alg:
I need to get all divisors of number first
I know how to iterate through a range from 1-number
and select only the numbers that have no modulo remainder with given, meaning modulo return value with number and given is 0
If resulting array is 1 in length, it's prime, so return "deficient"

- Raise StandardError if number passed in is negative

`classify` is a class method


Didn't know about the `class << self` syntax until looking at solution, how cool!

=end

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 0
    num = classification_helper(num)
  end 
  
  class << self
    private
  
    def classification_helper(num)
      divisors = (1..(num - 1)).to_a.select { |number| num % number == 0 }
      return "deficient" if divisors.length == 1
      sum = divisors.inject(:+)
      if sum == num
        return "perfect"
      elsif sum > num
        return "abundant"
      elsif sum < num
        return "deficient"
      end 
    end  
  end
end 

p num = PerfectNumber.classify(24)
