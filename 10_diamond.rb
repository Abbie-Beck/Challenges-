=begin

The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

    The first row contains one 'A'.
    The last row contains one 'A'.
    All rows, except the first and last, have exactly two identical letters.
    The diamond is horizontally symmetric.
    The diamond is vertically symmetric.
    The diamond has a square shape (width equals height).
    The letters form a diamond shape.
    The top half has the letters in ascending order.
    The bottom half has the letters in descending order.
    The four corners (containing the spaces) are triangles.

Examples

Diamond for letter 'A':

A

Diamond for letter 'C':

  A
 B B
C   C
 B B
  A

 A
B B
 A

Diamond for letter 'E':

    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A
 
    A   
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A   
    
    
OK, so I made a brute force version of each, now to make it to where I can pass in a letter and get a certain value.

If I get A, I just return A without any centering
If I get B, I need to center it with a single space around each A
            and B needs a space between

Whatever the length of the longest (number passed in ) line is, that's the first arg to "center" method (second arg is " ")
spaces in the middle starts with 1 * " " on B line and increments by 2 each line
For B line, first arg to rjust is "4" and second is ' '
This is same arg for ljust and it decrements by 1 for each subsequent line(letter)
each line is an interpolated string with trailing newline char and \ after quotes close
I need length (assoc with letter) - 2 middle lines - and 2 outer lines always


I HACKED AND SLASHED SO MUCH AHHH
=end 

class Diamond
 
  def self.make_diamond(letter)
    letters = ("A"..letter).to_a
    
    width = (2 * letters.size) - 1
    
    first_last_line = "#{"A".center(width)}\n"
    
    return first_last_line if letter == "A"
    
    just = width / 2
    spaces = 1
    
    middle_lines_ascending = ""
    letters[1..-1].each do |asc_letter|
      middle_lines_ascending << "#{asc_letter.rjust(just) + ' ' * spaces + asc_letter.ljust(just)}\n"
      just -= 1
      spaces += 2
    end 
  
    just += 2
    spaces -= 4
    middle_lines_descending = ""
    letters.pop
    desc_letters = letters[1..-1].reverse!
    desc_letters.each do |desc_letter|
      middle_lines_descending << "#{desc_letter.rjust(just) + ' ' * spaces + desc_letter.ljust(just)}\n"
      just += 1
      spaces -= 2
    end 
    "#{first_last_line}" \
    "#{middle_lines_ascending}" \
    "#{middle_lines_descending}" \
    "#{first_last_line}"
  end 
end 


puts Diamond.make_diamond("E")
