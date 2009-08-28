require File.dirname(__FILE__) + '/../../spec_helper'

describe Piece do
  describe "check" do
    before do
      @b = Board.new
      @b[0,0] = Queen.new(:white)
      @b[7,7] = King.new(:black)
      @b[6,4] = Rook.new(:black)
    end
    
    it "if in check, should only allow a move that takes you out of check" do
      @b.legal_move?( Position.new(6,4), Position.new(6,5) ).should be_false
    end
  end
end