class Piece
  attr_reader :sides
  def initialize(*sides)
    @sides = sides
  end

  def size()
    @sides.size
  end

  def mark(index)
    @sides[index]
  end

  def ==(a_piece)
    if self.sides.size() == a_piece.sides.size() then
      result = false
      Rotations.of(sides).each do |candidate|
        partial_result = true
        candidate.each_with_index do |mark, index|
          partial_result = partial_result && mark == a_piece.sides[index]
        end
        result = result || partial_result
      end
      return result
    end
    return false
  end
end

class Rotations
  include Enumerable

  def self.of(target)
    Rotations.new(target)
  end

  def initialize(target)
    @target = target
  end

  def each
    current = @target
    (0 ... current.size).each do
      yield current
      current = current.rotate
    end
  end
end
