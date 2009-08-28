require File.dirname(__FILE__) + '/../../spec_helper'

describe Queen do
  describe "movement" do
    before do
      @b = Board.new
      @b[0,0] = Queen.new(:white)
    end
    it "should allow ortho moves" do
      @b.legal_move?(Position.new(0,0), Position.new(2,0)).should be_true
      @b.legal_move?(Position.new(0,0), Position.new(0,2)).should be_true
    end
    
    it "should allow diagonal moves" do
      @b.legal_move?(Position.new(0,0), Position.new(2,2)).should be_true
      @b.legal_move?(Position.new(0,0), Position.new(4,4)).should be_true
    end
    
    it "should cannot jump diagonally" do
      @b[3,3] = Queen.new(:black)
      @b.legal_move?(Position.new(0,0), Position.new(4,4)).should be_false
    end
    
    it "should cannot jump orthogonally" do
      @b[3,0] = Queen.new(:black)
      @b.legal_move?(Position.new(0,0), Position.new(4,0)).should be_false
    end
  end
end