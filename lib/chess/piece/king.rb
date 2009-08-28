module Chess
  class King < Chess::Piece
    def initialize(color)
      @name = "k"
      super
    end
    
    def legal_move?(board, from, to)
      return false unless (from.h - to.h).abs == 1 && (from.w - to.w).abs == 1 ||
                          ( (from.h - to.h).abs + (from.w - to.w).abs == 1 )
      super
    end
  end
end