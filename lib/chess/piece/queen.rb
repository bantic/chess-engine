module Chess
  class Queen < Chess::Piece
    def initialize(color)
      @name = "q"
      super
    end
    
    def legal_move?(board, from, to)
      from
      super
    end
  end
end