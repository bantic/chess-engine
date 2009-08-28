module Chess
  class Rook < Chess::Piece
    def initialize(color)
      @name = "r"
      super
    end
    
    def legal_move?(board, from, to)
      return false unless (from.w == to.w) || (from.h == to.h)
      super
    end
  end
end