module Chess
  class Position
    attr_accessor :w, :h
    def initialize(w,h)
      @w = w
      @h = h
    end
    
    def self.from_string(str)
      raise ArgumentError unless match = str.downcase.match(/(\w)(\d)/)
      letter, digit = match[1], match[2].to_i
      w = ("a".."h").to_a.index(letter)
      h = 7-digit
      new(w,h)
    end
    
    def self.from_args(*args)
      args = args.flatten
      case args.first
      when String
        pos = Position.from_string(args.first)
      when Position
        pos = args.first
      when Fixnum
        pos = Position.new(args[0], args[1])
      end
      pos
    end
    
    def ==(other)
      w == other.w && h == other.h
    end
  end
end