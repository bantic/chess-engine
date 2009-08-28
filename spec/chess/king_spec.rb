require File.dirname(__FILE__) + '/../spec_helper'

describe King do
  describe "movement" do
    before do
      @b = Board.new
      @b[1,1] = King.new(:white)
    end
    
    it "should allow movement of one space" do
      @b.legal_move?(Position.new(1,1), Position.new(1,0)).should be_true
      @b.legal_move?(Position.new(1,1), Position.new(0,1)).should be_true
      @b.legal_move?(Position.new(1,1), Position.new(2,1)).should be_true
      @b.legal_move?(Position.new(1,1), Position.new(1,2)).should be_true
      @b.legal_move?(Position.new(1,1), Position.new(2,2)).should be_true
      @b.legal_move?(Position.new(1,1), Position.new(0,0)).should be_true
    end
    
    it "should not allow movement of > 1 space" do
      @b.legal_move?(Position.new(1,1), Position.new(3,1)).should be_false
    end
  end
end