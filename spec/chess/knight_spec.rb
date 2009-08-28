require File.dirname(__FILE__) + '/../spec_helper'

describe Knight do
  describe "movement" do
    before do
      @b = Board.new
      @b[0,0] = Knight.new(:white)
    end
    it "should allow L-shaped moves" do
      @b.legal_move?(Position.new(0,0), Position.new(2,1)).should be_true
      @b.legal_move?(Position.new(0,0), Position.new(1,2)).should be_true
    end
    
    it "can jump" do
      @b[1,1] = Knight.new(:black)
      @b.legal_move?(Position.new(0,0), Position.new(2,1)).should be_true
      @b.legal_move?(Position.new(0,0), Position.new(1,2)).should be_true
    end
  end
end