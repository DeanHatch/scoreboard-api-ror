require 'test_helper'

class BracketgroupingTest < ActiveSupport::TestCase
  
  # 
  # For testing, this Class proved to be a challenge.   There are a number of
  # conflicting aspects to providing useable Fixtures for this Test class.  The
  # first is that the Bracketgrouping class inherits from the Grouping class,
  # but not following the Single Table Inheritance (STI) pattern.  In STI,
  # multiple classes inherit from a single class which is, itself, not instantiated.
  # In this case, both the parent and child class are instantiated and there is only
  # one child class.  This means that there is no #type attribute to indicate which
  # class each instance belongs and, in fact, all instances belong to the parent class
  # but only some (or possibly no) instances belong to the child class.
  #
  # Fixtures, then, cannot belong to the Bracketgrouping (child) class bcause they also
  # would need to belong to the Grouping (parent) class, but then that would result in
  # rows with duplicate primary keys being entered into the groupings table.
  #
  # The workaround, for now, that I have employed is to explicitly convert each fixture-derived
  # Grouping instance into a Bracketgrouping instance with the #as_bracketgrouping method.
  # Defining my own #bracketgroupings method for this Test class did not work, nor did defining
  # a bracketgroupings Array in the setup method.
  # 
  
   #def bracketgroupings(*misc)
   #  groupings(misc)
   #end
   
  setup do
    #bracketgroupings = []
    #Grouping.all.each{|g| bracketgroupings << g if g.bracket_grouping}
  end
    
    # These three edge cases should be sufficient
  test "se_matchups" do
	assert  groupings(:bballdiv1).as_bracketgrouping.se_matchups(7) == [[[1, nil], [4, 5]], [[2, 7], [3, 6]]]
	assert  groupings(:bballdiv1).as_bracketgrouping.se_matchups(8) == [[[1, 8], [4, 5]], [[2, 7], [3, 6]]]
	assert  groupings(:bballdiv1).as_bracketgrouping.se_matchups(9) == [[[[1, nil], [8, 9]], [[4, nil], [5, nil]]], [[[2, nil], [7, nil]], [[3, nil], [6, nil]]]]
  end
     
  test "for_pair" do
	#p Bracketcontest.for_pair()
	#p Bracketcontest.all.collect{|c| c.display_date + " " + c.display_time}.join(" ")
  end
    
    # Seven Teams should result in the creation of Six Bracketcontests
  test "for_pair_champs" do
    #puts bracketgroupings.class.name
    #puts bracketgroupings.inspect()
    #puts self.methods.sort.join(" ")
    #assert_difference('Bracketcontest.count', 6) do
    #  matchups =  groupings(:bballdiv1).as_bracketgrouping.for_pair(groupings(:bballdiv1).as_bracketgrouping.se_matchups(7))
    #end
  end
  
end
