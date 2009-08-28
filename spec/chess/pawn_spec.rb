require File.dirname(__FILE__) + '/../spec_helper'

describe Pawn do
  describe "movement" do
    describe "white/black basics" do
      it "should know the starting pos" do
        wp = Pawn.new(:white)
        wp.starting_position?(Position.new(3,6)).should be_true
        
        bp = Pawn.new(:black)
        bp.starting_position?(Position.new(3,1)).should be_true
      end
      
      it "should know the correct movement direction" do
        wp = Pawn.new(:white)
        wp.correct_direction?(Position.new(3,6), Position.new(3,5)).should be_true
        
        bp = Pawn.new(:black)
        bp.correct_direction?(Position.new(3,1), Position.new(3,2)).should be_true
      end
    end
    
    describe "white pawns" do
      it "should allow single-space moves" do
        @b = Board.new
        @b[1,6] = Pawn.new(:white)
        @b.legal_move?(Position.new(1,6), Position.new(1,5)).should be_true
      end
      
      it "should allow double-space moves off the starting block" do
        @b = Board.new
        @b[1,6] = Pawn.new(:white)
        @b.legal_move?(Position.new(1,6), Position.new(1,4)).should be_true
      end
      
      it "should not allow double-space moves not off the starting block" do
        @b = Board.new
        @b[1,5] = Pawn.new(:white)
        @b.legal_move?(Position.new(1,5), Position.new(1,3)).should be_false
      end
      
      it "should not allow lateral movement unless capturing" do
        @b = Board.new
        @b[1,5] = Pawn.new(:white)
        @b.legal_move?(Position.new(1,5), Position.new(2,4)).should be_false
      end
      
      it "should allow lateral movement when capturing" do
        @b = Board.new
        @b[1,5] = Pawn.new(:white)
        @b[2,4] = Pawn.new(:black)
        @b.legal_move?(Position.new(1,5), Position.new(2,4)).should be_true
      end
      
      it "should not allow lateral capturing movement if the piece is the same color" do
        @b = Board.new
        @b[1,5] = Pawn.new(:white)
        @b[2,4] = Pawn.new(:white)
        @b.legal_move?(Position.new(1,5), Position.new(2,4)).should be_false
      end
      
      it "should cannot jump" do
        @b = Board.new
        @b[1,6] = Pawn.new(:white)
        @b[1,5] = Knight.new(:black)
        @b.legal_move?(Position.new(1,6), Position.new(1,4)).should be_false
      end
    end
  end
end