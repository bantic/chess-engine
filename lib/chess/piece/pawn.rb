module Chess
  class Pawn < Chess::Piece
    def initialize(color)
      @name = "p"
      super
    end
    
    def legal_move?(board, from, to)
      return false unless correct_direction?(from, to)
      if starting_position?(from)
        return false unless (to.h - from.h).abs <= 2
      else
        return false unless (to.h - from.h).abs == 1
      end
      
      if from.w != to.w
        return false unless board[to] && board[to].color != self.color
      end
        
      super
    end
    
    def correct_direction?(from, to)
      case color
      when :white
        to.h < from.h
      when :black
        to.h > from.h
      end
    end
    
    def starting_position?(pos)
      case color
      when :white
        return pos.h == 6
      when :black
        return pos.h == 1
      end
    end
  end
end