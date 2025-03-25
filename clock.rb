=begin

Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given Clock object. Note that you should not mutate Clock objects when adding and subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.



THOUGHTS:

create a clock (we'll see what independent of date means)
methods that add or subtract mins (meaning method that creates new instance of clock that references prior version but with additional or less mins)
define == method so that clocks that have same time are equal
no time or date methods (yay, seems like less of a headache)

EXAMPLES

time is in military time, with hours and mins separate (perhaps two items in an array there are no miliseconds to think of)
when we subtract minutes from less than the minutes available, we "wrap around"
so if we subtract 60 min from [0 and 30] min, we get [23 and 30.]
same for if we add to max miliary time, so if we add 60 to [23 and 30], we get [0 and 30.]
we need a to_s method that prints this string `hours:minutes`


So if clock is subtracted from down to 0, the remaining subtraction should be made from [24, 60]


I think I need a subtraction and addition method, because they must return a new clock. Also I need to set it up so that:
  - always adds minutes, if addition exceeds 60, do a divmod thang:
        if time is 61:
          - hours_added, mins_added = 61.divmod(60)
          this means we add one hour and one minute
        if we are at 10:20 and we subtract 50
          -hours_subbed, mins_subbed = 50.divmod(60)
          mins_subbed is at 50
            if we subtracted like 20 mins and then mins is at 0,
            we must convert hours to one less and set mins to 60 and subtract the remaining balance (30) from mins
            
Addition Method:
  -always divmod first, no harm in that
  - if added mins exceed 60, divmod and add the number of hours returned by first value when you call divmod on added mins and pass in 60
  - add the second value to mins
  
  WHAT IF MY ADDITION MAKES TIME EXCEED 24:00 ?
    hours set to 0, mins stays the same
    
Subtraction Method:
  - do the divmod thing
  - if subbed mins is over 60, divmod and sub first value from hours and second value from mins
  
  WHAT IF MY SUBTRACTION MAKES TIME UNDER 0:0 ?
    hours set to 24
    mins untouched
    
So for subtraction, I have an error in my logic that's gumming up the works
  
=end

#REVISED 
# changed init and at methods and made readers for hour and minute instead of a time array
# formatted together instead of two sep formatted strings concatenated together
# added MINS_IN_DAY constant to extract magic number 1440
# Now to make addition and subtraction methods more sleek with better logic
# added a helper and made it private as well

class Clock
  attr_reader :hours, :mins

  HOURS_IN_DAY = 24
  MINS_IN_HOUR = 60
  MINS_IN_DAY = HOURS_IN_DAY * MINS_IN_HOUR

  def initialize(hours, mins)
    @hours = hours
    @mins = mins
  end

  def self.at(hours, mins=0)
    new(hours, mins)
  end

  def to_s
    format('%02d:%02d', hours, mins)
  end

  def +(addition)
    original_mins = original_min_converter
    total_mins = original_mins + addition
    total_mins %= MINS_IN_DAY if total_mins >= MINS_IN_DAY
    new_hours, new_mins = total_mins.divmod(60)
    Clock.new(new_hours, new_mins)
  end

  def -(subtraction)
    original_mins = original_min_converter
    total_mins = original_mins - subtraction
    total_mins += MINS_IN_DAY until total_mins > 0
    new_hours, new_mins = total_mins.divmod(60)
    Clock.new(new_hours, new_mins)
  end

  def ==(other_clock)
    hours == other_clock.hours && mins == other_clock.mins
  end

  private

  def original_min_converter
    (hours * MINS_IN_HOUR) + mins
  end
end

puts Clock.at(23, 30) + 60
