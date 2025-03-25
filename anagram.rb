=begin

Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.



P: 

- anagrams are words that contain all of the same characters but are in a different order 
- the same letters in the same order don't count as anagrams:
 FROM TEST FILE:
    detector = Anagram.new('corn')
    anagrams = detector.match %w(corn dark Corn rank CORN cron park)
    assert_equal ['cron'], anagrams
    
  - anagrams case insensitive:
  FROM TEST FILE
    detector = Anagram.new('Orchestra')
    anagrams = detector.match %w(cashregister Carthorse radishes)
    assert_equal ['Carthorse'], anagrams

If none, return empty array

need `match` instance method

constructor method takes arg, word to test against list of anagrams passed to the `match` instance method


D/A

To figure out if a word contains all same letters but is not in same order as test word:
For each in array:
- first check if test_word.downcase == word.downcase. if so, it's not one
- then check if test_word.downcase.sort == word.downcase.sort, if it is, add to result of match method array

*** had to call chars because you can't sort a string, duh!

=end

# REVISED!

class Anagram
  attr_accessor :primary_word

  def initialize(primary_word)
    @primary_word = primary_word
  end

  def match(arr_of_strings)
    list_of_anagrams = []
    arr_of_strings.each do |word|
      next if word.downcase == primary_word.downcase
      if word.downcase.chars.sort.join == primary_word.downcase.chars.sort.join
        list_of_anagrams << word
      end
    end
    list_of_anagrams
  end
end

detector = Anagram.new('Orchestra')
p detector.match %w(cashregister Carthorse radishes)
