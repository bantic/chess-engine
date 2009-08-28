module Chess
  class Board

    def initialize
      @width = 8
      @height = 8
      @pieces = Array.new(@width) {Array.new(@height)}
    end
    
    def [](*args)
      pos = Position.from_args(args)
      @pieces[pos.w][pos.h]
    end
    
    def []=(*args)
      pos = Position.from_args(args)
      @pieces[pos.w][pos.h] = args.last
    end
    
    def legal_move?(from, to)
      return false if self[from].nil?
      return self[from].legal_move?(self, from, to)
    end
    
    def attacked?(pos, color)
      @width.times do |w|
        @height.times do |h|
          if piece = self[w,h]
            return true if piece.color == color && piece.legal_move?(self, Position.new(w,h), pos)
          end
        end
      end
      return false
    end

    def in_check?(color)
      @width.times do |w|
        @height.times do |h|
          if self[w,h] && self[w,h].name == "k" && self[w,h].color == color
            return attacked?( Position.new(w,h), color == :white ? :black : :white)
          end
        end
      end
    end
    
    def clear_path?(from, to)
      return true if ( (from.h - to.h).abs == 1 && (from.w - to.w).abs == 1 ||
                       (from.h - to.h).abs + (from.w - to.w).abs == 1 )
      
      if from.h == to.h || from.w == to.w # ortho
        if from.h == to.h
          range = from.w > to.w ? (to.w + 1)..(from.w - 1) : (from.w + 1)..(to.w - 1)
          range.each {|w| return false if self[w,from.h]}
        else
          range = from.h > to.h ? (to.h + 1)..(from.h - 1) : (from.h + 1)..(to.h - 1)
          range.each {|h| return false if self[from.w,h]}
        end
      elsif (from.h - to.h).abs == (from.w - to.w).abs # diagonal
        range_w = from.w > to.w ? (to.w + 1)..(from.w - 1) : (from.w + 1)..(to.w - 1)
        range_h = from.h > to.h ? (to.h + 1)..(from.h - 1) : (from.h + 1)..(to.h - 1)
        
        range_w.each_with_index do |w, w_idx|
          range_h.each_with_index do |h, h_idx|
            return false if w_idx == h_idx && self[w,h]
          end
        end
      end
      
      return true
    end
    
    def in_bounds?(pos)
      pos.w >= 0 && pos.h >= 0 && pos.w < @width && pos.h < @height
    end
    
    def to_s
      spacer = "  " + "+---" * @width + "+"
      rows = []
      @height.times do |h|
        row = (1..8).to_a[7-h].to_s + " "
        @width.times do |w|
          row += "| #{self[w,h] || " "} "
        end
        row += "|"
        rows << row
      end
      
      out = ([spacer] * (@height + 1)).zip(rows).flatten.join("\n")
      out + "  " + ("a".."h").to_a.map{|i| "  #{i}"}.join(" ") + "\n"
    end
  end
end