require File.dirname(__FILE__) + '/../../spec_helper'

describe Bishop do
  describe "movement" do
    before do
      @b = Board.new
      @b[3,4] = Bishop.new(:white)
    end
    
    it "should allow diagonal moves" do
      @b.legal_move?(Position.new(3,4), Position.new(6,7)).should be_true
      @b.legal_move?(Position.new(3,4), Position.new(0,1)).should be_true
    end
    
    it "should not allow ortho moves" do
      @b[3,4] = Bishop.new(:white)
      @b.legal_move?(Position.new(3,4), Position.new(3,5)).should be_false
    end
    
    it "should cannot jump diagonally" do
      @b[4,5] = Queen.new(:black)
      @b.legal_move?(Position.new(0,0), Position.new(5,6)).should be_false
    end
  end
end