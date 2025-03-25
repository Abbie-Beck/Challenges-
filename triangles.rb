# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

=begin

P:
  - input - 3 lengths (integers)
  - output - if it's a valid triangle, if so which kind, if not, say it's not
  
  valid triangle criteria:
    - each side length greater than 0
    - sum of lengths of any two sides must be greater than length of remaining side
  specific triangle criteria:
    - equilateral - all sides same length
    - isosceles - two sides same length
    - scalene - three sides of unequal length (none alike)
    
E:

 - we need a `Triangle` class
  - needs constructor that accepts three length args
  - exception needs to be raised if any side less than 0
  - exception raised when sides together don't equal valid triangle (if combo of any two sides not greater than remaining) 
  
- need a `kind` method that returns string repping type of triangle
- look into helper methods

Data-flow
  -3 integer lengths (comparing as elements of array) => raise ArgumentError if any side is 0 or less or sides together aren't larger than other side => check if all sides are same, if so it's equilateral => if not, check if two sides are same, if so it's isosceles => if it's valid and other two didn't return true, it's scalene => so pass result as string to `kind` method so it can output it. (to check if sides are same, use `uniq` method and check size of array after calling it)
  
  A:
  
  make constructor take three sides and make instance vars
  add lengths to array instance var
  raise ArgumentError from constructor instance method if it's not valid
      - this means checking if `any?` sides are 0
      - then checking if any of the possible combos of sides is less than the remaining side (so side1 + side2 greater than side 3 && side2 + side3 greater than side1 && side1 + side3 greater than side2)
  return type from method that supplies "kind" if it is:
    - helper to decide kind should 
      - call uniq on array, if it's 1 in length, it's equilateral, 2 in length is isosceles, 3 in length scalene
  
=end 

# Revised! 

# class Triangle
#   attr_accessor :lengths
  
#   def initialize(length1, length2, length3)
#     @lengths = [length1, length2, length3]
#     if invalid?
#       raise ArgumentError, "invalid triangle"
#     end 
#   end 
  
#   def invalid?
#     lengths.any? { |length| length <= 0 }    ||
#     (lengths[0] + lengths[1]) <= lengths[2] ||
#     (lengths[1] + lengths[2]) <= lengths[0] ||
#     (lengths[0] + lengths[2]) <= lengths[1]
#   end 
  
#   def kind
#     case lengths.uniq.size
#     when 1 then return "equilateral"
#     when 2 then return "isosceles"
#     when 3 then return "scalene"
#     end 
#   end 
# end 













