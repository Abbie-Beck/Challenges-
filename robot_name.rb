=begin

Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. Your solution should not allow the use of the same name twice.


P: 

input: just a call to the `name` instance method
output: new name with 2 cap letters and 3 decimal digits

We have seeds and such, constants to test whether they are the same when starting with same seed, and to test if they are different as in randomly generated.

We have a regex in our test suite that I think could be useful to use in our class here to ensure what I described above about name reqs

How do I make sure that the same seed won't generate the same name? I need a condition that can evaluate the previous name and ensure the new one is different
=end 

class Robot
  @@prior_names = []
  
  def name
    return @name if @name
    letters = ('A'..'Z').to_a.sample(2).join
    numbers = ('0'..'9').to_a.sample(3).join
    robot_name = letters + numbers
    
    if @@prior_names.include?(robot_name)
      @name = reset
    else 
      @name = robot_name
      @@prior_names << @name
    end 
    @name
  end 
  
  def reset
    @@prior_names.delete(@name)
    @name = nil
    self.name
  end 
end 
