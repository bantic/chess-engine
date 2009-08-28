module Chess
  class Bishop < Chess::Piece
    def initialize(color)
      @name = "b"
      super
    end
    
    def legal_move?(board, from, to)
      return false unless (from.h - to.h).abs == (from.w - to.w).abs
      super
    end
  end
end