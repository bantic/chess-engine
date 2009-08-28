require File.dirname(__FILE__) + '/../spec_helper'

describe Chess::Board do
  describe "clear_path?" do
    it "should be correct for contiguous squares" do
      b = Board.new
      b[1,1] = Rook.new(:white)
      b[2,1] = Rook.new(:black)
      b.clear_path?(Position.new(1,1), Position.new(2,1)).should be_true
      b.clear_path?(Position.new(1,1), Position.new(2,2)).should be_true
      b.clear_path?(Position.new(1,1), Position.new(0,1)).should be_true
      b.clear_path?(Position.new(1,1), Position.new(1,0)).should be_true
      b.clear_path?(Position.new(1,1), Position.new(0,0)).should be_true
    end
    
    it "should be ortho correct height-wise" do
      b = Board.new
      b[0,0] = Rook.new(:white)
      b[0,5] = Rook.new(:white)
      b.clear_path?(Position.new(0,0), Position.new(0,5)).should be_true
      b.clear_path?(Position.new(0,0), Position.new(0,6)).should be_false
    end
    
    it "should be ortho correct width-wise" do
      b = Board.new
      b[0,0] = Rook.new(:white)
      b[5,0] = Rook.new(:white)
      b.clear_path?(Position.new(0,0), Position.new(5,0)).should be_true
      b.clear_path?(Position.new(0,0), Position.new(6,0)).should be_false
    end
    
    it "should be diagonal correct" do
      b = Board.new
      b[0,0] = Bishop.new(:white)
      b[2,2] = Bishop.new(:black)
      b.clear_path?(Position.new(0,0), Position.new(2,2)).should be_true
      b.clear_path?(Position.new(0,0), Position.new(3,3)).should be_false
    end
  end
  
  describe "attacking" do
    it "should work" do
      b = Board.new
      b[0,0] = Bishop.new(:white)
      b.attacked?( Position.new(0,0), :black).should be_false
      
      b[3,3] = Bishop.new(:black)
      b.attacked?( Position.new(0,0), :black).should be_true
      
      # piece in the way
      b[2,2] = Bishop.new(:white)
      b.attacked?( Position.new(0,0), :black).should be_false
    end
  end
  
  describe "in_check?" do
    it "should work ok" do
      b = Board.new
      b[3,3] = King.new(:white)
      b[4,3] = Queen.new(:black)
      b.in_check?( :white ).should be_true
    end
  end
end