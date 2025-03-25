=begin

Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable to the accumulated result of beneficial microscopic mutations over many generations.

The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

This is called the Hamming distance.

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length



P:

-input: string for constructor and for `hamming_distance` instance method
-output: integer rep of counted variations from constructor string and hamming string
- if hamming string longer than constructor string, only look at diffs up to length of constructor string
- same for if the constructor string longer, just compare what's equal length (so maybe slice the string at the same length)

E: 
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

7 differences = 7 being the Hamming distance

Data-flow: String for DNA instance constructor & string for `hamming_distance` instance method => slice both to length of shorter one => compare, counting any times when the current constructor string char doesn't match hamming_dist string. => return this count

Alg:

To slice strings:
(for either string)
if string.length is less than other_string.length, other_string equals other_string sliced from 0 to the length of other string

To compare: (in hamming dist)
Turn constructor string into an array of chars
Call each with index on it
Init counter
If hamming char != constructor char, increment counter

Return counter from hamming_distance method
=end

# Revised Solution!

# class DNA
#   attr_accessor :ham_string
  
#   def initialize(ham_string)
#     @ham_string = ham_string
#   end 
  
#   def hamming_distance(test_str)
#     hamming_str = ham_string
#     testing_str = test_str
#     counter = 0
    
#     if hamming_str.length > testing_str.length
#       hamming_str = hamming_str[0...testing_str.length]
#     elsif testing_str.length > hamming_str.length
#       testing_str = testing_str[0...hamming_str.length]
#     end 
    
#     hamming_str.chars.each_with_index do |char, idx|
#       if char != testing_str[idx]
#         counter += 1
#       end 
#     end 
#     counter
#   end 
# end 

# strand = 'GACTACGGACAGGGTAGGGAAT'
# distance = 'GACATCGCACACC'
# p DNA.new(strand).hamming_distance(distance) # 5








class DNA
  def initialize(source_ham)
    @source_ham = source_ham
  end 
  
  def hamming_distance(input_ham)
    source_ham = @source_ham
    if input_ham.length > @source_ham.length
      input_ham = input_ham[0...@source_ham.length]
    elsif input_ham.length < @source_ham.length
      source_ham = @source_ham[0...input_ham.length]
    end 

    distance = []
    source_ham.chars.each_with_index do |char, idx|
      if char != input_ham[idx]
        distance << char
      end 
    end 
    distance.size
  end 
  # calc hamming distance 
  # that is differences between strings
  # constructor that takes a string
  # then `hamming_distance` method that takes a string
  # shorten either arg if discrepency, but don't shorten the constructor string permanently. 
end 

my_dna = DNA.new('GGACGGATTCTGACCTGGACTAATTTTGGGG')
p my_dna.hamming_distance('AGGACGGATTCTGACCTGGACTAATTTTGGGG')


# my_size = "1234".size

# my_string = "123455"
# p my_string.chars[0...my_size].join
