=begin

Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

    012
    123
    234

Likewise, here are the 4-digit series:

    0123
    1234

Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.

=end

=begin

P:
input: 
  -string of digits arg to the constructor
  -length of subarrays of digits, turned from strings to integers
  
  rules: 
  - if we input a number larger than string for length, raise ArgumentError
  
  
  Data-Flow: string of digits / length of subarrs => if length larger than length of arr, ArgError => from idx 0 to length - number that specifies subarr length: generate subarrays of length provided => map those string digits to integers, return subarrs in larger array

=end

class Series
  
  attr_accessor :digit_str
  
  def initialize(digit_str)
    @digit_str = digit_str
  end 
  
  def slices(length)
    raise ArgumentError, "Excessive length!" if length > digit_str.length
    subarrs = []
    (0..digit_str.length - length).each do |start_idx|
      subarrs << (digit_str[start_idx, length]).chars.map(&:to_i)
    end 
    subarrs
  end 
  
end 

test = Series.new("4567")
p test.slices(4)
