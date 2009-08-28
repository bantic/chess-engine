module Chess
  class Piece
    attr_accessor :color, :name
    
    def initialize(color)
      @color = color
    end
    
    def legal_move?(board, from, to)
      return false if from.w == to.w && from.h == to.h
      return false unless board.in_bounds?(from) && board.in_bounds?(to)
      
      piece = board[from]
      return false if piece != self
      return false if board[to] && board[to].color == piece.color
      return false unless board.clear_path?(from, to)
      return true
    end
    
    def ==(other)
      self.color == other.color && self.name == other.name
    end
    
    def to_s
      case @color
      when :white
        @name.upcase
      else
        @name.downcase
      end
    end
  end
end