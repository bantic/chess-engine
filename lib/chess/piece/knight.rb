module Chess
  class Knight < Chess::Piece
    def initialize(color)
      @name = "n"
      super
    end
    
    def legal_move?(board, from, to)
      return false unless ( ( (from.h - to.h).abs == 2 && (from.w - to.w).abs == 1 ) ||
                            ( (from.h - to.h).abs == 1 && (from.w - to.w).abs == 2 ) )
      super
    end
  end
end