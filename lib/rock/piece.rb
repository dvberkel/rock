class Piece
  attr_reader :sides
  def initialize(*sides)
    @sides = sides
  end

  def ==(a_piece)
    self.sides.size() == a_piece.sides.size()
  end
end
