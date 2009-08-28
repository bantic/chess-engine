require File.dirname(__FILE__) + '/../spec_helper'

describe Position do
  describe "#from_string" do
    it "should parse the string" do
      Position.from_string("a1").should == Position.new(0,6)
      Position.from_string("e2").should == Position.new(4,5)
    end
  end
  
  describe "#from_args" do
    it "should work" do
      Position.from_args(1,2).should == Position.new(1,2)
      Position.from_args(3,2,1).should == Position.new(3,2)
      Position.from_args( Position.new(1,1) ).should == Position.new(1,1)
      Position.from_args( "e5" ).should == Position.new(4, 2)
    end
  end
end