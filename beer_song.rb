# Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

=begin

P:

input: integer arg to `verse` class method 
        OR
        multiple integer args to `verses` class method
        OR
        nothing, calling the `lyrics` class method and getting the whole song
        
output: either the verse you wanted, the verses you wanted, or the whole song as a string

rules: 
 - lookin at you, newline characters. let's consult the info they provide to see if they say anything:
 - LS SAYS
  -   Each line of each verse should be separated by a newline
  -   Verses should be separated by a blank line (two consecutive newlines).

USE what you learned from exercise 2 of Medium 1:

text = File.read("ex2.txt")
analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }

So I want to get lines like I did in the lines example above, then assign them to a number (so maybe populate a hash with numbers and )

Examples: 

passing verse one number gets that verse
passing two gets that verse up to the index passed in?
lyrics method gives all lyrics
it seems like they want us to take a generative approch, generating each line at will? Idk I want to break it up into lines and then assign each one to an index or something, like maybe a hash that associates each line with each 

NO they don't want the line number, the input integer should be the same as the number of bottles for that verse. Woah.
Ok.. how to do... I need to search the verse, so I need to check each verse, using each, and when I get to a verse that includes my number twice (because it includes the next number once) I will return that verse. If that doesnt happen, we auto return the last one (search for "no more" if 0? how??)

So I have my class `verse` method set up. What do I need to return for verses? The newline chars and / characters confuse me on how to get accurate output. 

so it's like a range where I return from first num..last num verses... 
=end 

class BeerSong
  
  def self.verse_format(verse_num, bottle1, bottle2)
    "#{verse_num} #{bottle1} of beer on the wall, #{verse_num} #{bottle1} of beer.\n" \
    "Take one down and pass it around, #{verse_num - 1} #{bottle2} of beer on the wall.\n"
  end 

  def self.verse(verse_num)
    bottles = "bottles"
    bottle = "bottle"
    if (3..99).to_a.include?(verse_num)
      return verse_format(verse_num, bottles, bottles)
    elsif verse_num == 2
      return verse_format(verse_num, bottles, bottle)
    elsif verse_num == 1
      return "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif verse_num == 0
      return "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end 
  end 
  
  def self.verses(start_verse, end_verse=nil)
    if end_verse.nil?
      return verse(start_verse)
    else 
      verses_string = ""
      start_verse.downto(end_verse).each_with_index do |verse_num, index|
        verses_string << verse(verse_num)  # Add the verse
        
        # Add a newline after the verse if it's not the last verse
      verses_string << "\n" unless index == start_verse - end_verse
      end
    return verses_string
    end 
  end 
  
  def self.lyrics
    song = ""
    99.downto(0).each do |verse_number|
      song << verse(verse_number)
      song << "\n"
    end 
    song.chomp
  end 
end 

puts BeerSong.lyrics
