=begin

Meetups are a great way to meet people who share a common interest. Typically, meetups happen monthly on the same day of the week. For example, a meetup's meeting may be set as:

    The first Monday of January 2021
    The third Tuesday of December 2020
    The teenth Wednesday of December 2020
    The last Thursday of January 2021

In this program, we'll construct objects that represent a meetup date. Each object takes a month number (1-12) and a year (e.g., 2021). Your object should be able to determine the exact date of the meeting in the specified month and year. For instance, if you ask for the 2nd Wednesday of May 2021, the object should be able to determine that the meetup for that month will occur on the 12th of May, 2021.

The descriptors that may be given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'. The case of the strings is not important; that is, 'first' and 'fIrSt' are equivalent. Note that "teenth" is a made up word. There was a meetup whose members realised that there are exactly 7 days that end in '-teenth'. Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is the "teenth" of that day in every month. That is, every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc. The fifth day of the month may not happen every month, but some meetup groups like that irregularity.

The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'. Again, the case of the strings is not important.

# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule).
# where weekday is one of: monday, tuesday, wednesday, etc.
# and schedule is first, second, third, fourth, fifth, last, or teenth.


I'm thinking if I work with a range (specified end of range below for each month)
from 1-end of month
that I can generate dates for the year starting with 1, and I can increment a counter when I get a day using `day` method that matches day I'm looking for
I can stop counter and return the date, month and year (year, month, date) format 
date = Date.new(2025, 3, 10)
date.day

also a `next_day` method

31 - Jan March May July Aug October December
30 - April June September November
28 - Feb

case month_length

# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule).
# where weekday is one of: monday, tuesday, wednesday, etc.
# and schedule is first, second, third, fourth, fifth, last, or teenth.


OK I started off with an idea then hacked and slashed my way to this. Sorry LS

=end

require 'date'

class Meetup
  attr_reader :year, :month
  attr_accessor :weekdays, :date

  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.new(year, month, 1)
    @weekdays = []
  end

  SCHEDULE_CONVERTER =
    {
      "first" => 0,
      "last" => -1,
      "second" => 1,
      "third" => 2,
      "fourth" => 3,
      "fifth" => 4
    }

  WEEKDAY_CONVERTER =
    {
      "sunday" => 0,
      "monday" => 1,
      "tuesday" => 2,
      "wednesday" => 3,
      "thursday" => 4,
      "friday" => 5,
      "saturday" => 6
    }

  def teenth_helper(weekdays)
    weekdays.find { |day| (13..19).cover?(day.day) }
  end

  def weekday_helper(weekday)
    while date.month == month
      weekdays << date if date.wday == WEEKDAY_CONVERTER[weekday.downcase]
      self.date = date.next_day
    end
    weekdays
  end

  def day(weekday, schedule)
    sched = SCHEDULE_CONVERTER[schedule.downcase]

    weekday_helper(weekday)

    schedule == "teenth" ? teenth_helper(weekdays) : weekdays[sched]
  end
end

p date = Meetup.new(2013, 7).day("Wednesday", "teenth")
