require File.dirname(__FILE__) + '/../spec_helper'

describe Rook do
  describe "movement" do
    before do
      @b = Board.new
      @b[0,0] = Rook.new(:white)
    end
    
    it "should allow ortho moves" do
      @b.legal_move?(Position.new(0,0), Position.new(4,0)).should be_true
      @b.legal_move?(Position.new(0,0), Position.new(0,2)).should be_true
    end
    
    it "should cannot jump" do
      @b[3,0] = Bishop.new(:white)
      @b.legal_move?(Position.new(0,0), Position.new(4,0)).should be_false
    end
  end
end