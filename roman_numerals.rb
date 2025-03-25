=begin

Write some code that converts modern decimal numbers into their Roman number equivalents.

The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots of straight lines and are hence easy to hack into stone tablets.

 1  => I
10  => X
 7  => VII
 

There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:

2000=MM
8=VIII

=end 

=begin

P

input: integer
output: string of roman numerals that represent integer passed in


INSTANCE METHOD - `roman_numeral`
"A method that returns the Roman numeral representation of that number as a string. The name of this method will be either to_roman or toRoman depending on the conventions for your programming language of choice."
"
I need to write code that converts modern decimal numbers into their roman number equivalents

1, 2, 3 = I, II, III
4, 5, 6, 7 = IV, V, VI, VII
8, 9, 10 = VIII, IX, X
20, 30, 40, 50 = XX, XXX, LX, L
60, 70, 80, 90 = LX, LXX, LXXX, XC
100 = C
500 = D
1,000 = M

skip zeros (like the expanded numbers problem from code wars, but not converting to a string with plus signs)

Example
2751 == "MMDCCLI"
          ^ "MM" is 2000
             ^ "DCC" is 700
              ^ "L" is 50
               ^ "I" is 1

I need to get the thousands, hundreds, tens, and ones places first and assign those to variables that tell me their place (so I can know how to convert them properly)
**(case statement or if/else?)


ALGORITHM:
 - constructor accepts integer argument
 - makes instance variable so we can work with it
 
 - ROMAN NUMERALS COLLECTION
    - I'm thinking of a series of case statements starting with one for thousands place and ending with one for ones place, in descending order
    
  - METHOD to CONVERT
    - Init empty string to return variable (roman_numeral = '')
    - Subtract the numeric value of the added Roman numerals from the current input value, and use the new input value in subsequent iterations. For instance, since we added CCC to the string above, we must subtract 300 from 367, leaving us with a new input number of 67. 
       - Like expanded numbers:

          thousands:
            dividing by 1000 gets me the thousands place
          hundreds:
            getting the thousands place out of the way with num % 1000 
            then dividing by 100 gets me the hundreds place
          tens:
            getting thousands and hundreds places out of the way with num % 100
            then dividing by 10 gets me the tens place
          ones:
            num % 10 gets me the ones place
            
          Then: try case statement since you don't like to use them!
          Roman numeral return value should be a string (because letters)
          
          case for each "place" (case thousands, case hundreds, etc)
          for each, up to 9, increment the roman numeral string by the letter that         corresponds to that (for a 5 in the hundreds place, concatenate "D" to string)
          Should skip any case statement for which there isn't a value (start with 1 in          case statements so that if it's 0, it never gets evaluated by case statement)
          ^ prob obvious 
          
          return value of `roman_numeral` instance method should be the string we have        created
=end 


 
# REBUILT FROM LS SOLUTION, DELETED MINE BUT DIDN'T REVISE YET
 
=begin

we have our hash of conversions and constructor and accessor for the input decial number. For each roman numeral, we have its decimal equiv. We have from 1000 to 1, we seem to only have what we need and not everything like me solution. 

Then in the `to_roman` method, we are converting. we have an empty string for `roman_version` at top, then we have a `to_convert` local var being assigned to `number`

In the each, we iterate over our conversion hash.
we assign two values, multiplier and remainder to the return of calling the `divmod` method on `to_convert` and passing in `value` which is the roman equivalent from hash. 

so for each value that we have in our hash, we are divmod-ing with our `to_convert` value. if value goes into the number reffed by `to_convert` at all, that is, if multiplier is assigned to anything over 0, we concat the key (roman numeral) to the `roman_version` string `multiplier` number of times (because it's checking 300 against 100, the result is 3 and that's how many roman numeral hundreds are needed, then we have our odd ones like 4 and 9 because those would be pretty convoluted to convert otherwise, while 6 is just 5 and then we worry about the I (1's) that follow later)
  After this is done, we assign our `to_convert` value to the remainder, because we already have the multiplier handled. 
  At the end, we simply return `roman_version`

=end 



class RomanNumeral
  attr_reader :decimal_num
  
  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }
 
  def initialize(decimal_num)
    @decimal_num = decimal_num
  end 

  def to_roman
    roman_version = ''
    to_convert = decimal_num
    
    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      unless multiplier <= 0
        roman_version += (key * multiplier)
      end 
      to_convert = remainder
    end 
    roman_version
  end 
end
