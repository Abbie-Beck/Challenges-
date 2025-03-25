=begin

P:

make own custom set type

set is a collection that seems to be like an unordered array without duplicates
internal workings don't matter as long as behavior is right
(so I can use array internally?)

all elements of our sets are numbers

Methods I need:

- constructor that sets default to empty array or collection obj
- empty? (instance method)
- contains? (instance method that works like include?)
- subset? (instance method that compares passed in intance of CustomSet class with another. If the one that it's being called on is empty, that empty array counts as a subset of the non-empty but no vice versa) (as long as the bigger one contains all elements of smaller or smaller is empty, returns true)
- disjoint? method that returns true if none of elements in one set are in other.
- eql? (inst method that checks if all elements contained in one set are in other set, order is not a factor)(since set will auto-reject duplicates, a set like 1221 will be eql to 21)
- add method that adds element
- intersection method that seems to be for finding elements that are shared (same) between two sets
- difference method that does opposite (finds what is different)
- union method that adds waht is missing from one to another, if there is diff (so utilizes the difference method)
- 

=end 

class CustomSet
  attr_accessor :set
  
  def initialize(set=[])
    @set = set.uniq
  end 
  
  def empty?
    set.empty?
  end 
  
  def contains?(value)
    set.include?(value)
  end 
  
  def subset?(other_set)
    return true if self.set.empty?
    set.all? do |item|
      other_set.set.include?(item)
    end 
  end 
  
  def disjoint?(other_set)
    set.none? do |item|
      other_set.set.include?(item)
    end 
  end 
  
  def eql?(other_set)
    self.set.sort == other_set.set.sort
  end 
  
  def add(value)
    self.set << value
    self.set.uniq!
    self
  end 
  
  def ==(other_set)
    set == other_set.set
  end 
  
  def intersection(other_set)
    new_set = CustomSet.new
    new_set.set << set.select do |item|
      other_set.set.include?(item)
    end 
    new_set.set.flatten!
    new_set
  end 
  
  def difference(other_set)
    new_set = CustomSet.new
    new_set.set << set.select do |item|
      !other_set.set.include?(item)
    end 
    new_set.set.flatten!
    new_set
  end 
  
  def union(other_set)
    other_set.set.each do |item|
      set << item
    end 
    self.set = set.sort.uniq
    self
  end 
end
