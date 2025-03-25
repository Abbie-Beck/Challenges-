=begin
Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

=end

=begin

input: either a number or a default value of 3 & 5
       this is the arg to the constructor
       also a given number passed to `to` method, not optional
output: sum of all multiples of either 3 & 5 or arg to constructor (if provided) from 2-number or 


D /A

- constructor must have default arg of [3, 5]
- `to` is class method and an instance method (call instance method within class method like LS solution from previous exercise)
- I need to iterate over range from 2-(num - 1) (1 just multiplies by itself so not needed, also description leaves them out above)
- select numbers that evenly divide by either 3 or 5 OR given numbers if given
  - either way, we are checking each number in array and pushing numbers that evenly divide (no modulo remainder) by them into a new array
  - this array includes the given numbers we are checking, of course
  
  
  ** need to flatten my result, then call uniq to avoid repeat numbers that are multiples of each, whaat a headache figuring that out was!
=end


class SumOfMultiples
  attr_reader :divisors
  
  def initialize(*args)
    @divisors = args.empty? ? [3, 5] : args
  end 
  
  def self.to(base_num)
    SumOfMultiples.new.to(base_num)
  end 
  
  def to(base_num)
    return 0 if base_num < 2
    new_arr = []
    divisors.each do |divisor|
      new_arr << (2...base_num).to_a.select { |num| num % divisor == 0 }
    end 
    new_arr.flatten.uniq.inject(:+)
  end 
end 

p num = SumOfMultiples.new.to(100)
