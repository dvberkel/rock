class Piece
  attr_reader :sides
  def initialize(*sides)
    @sides = sides
  end

  def ==(a_piece)
    if self.sides.size() == a_piece.sides.size() then
      sides.each_with_index do |mark, index|
        if !(mark == a_piece.sides[index]) then
          return false
        end
        return true
      end
    end
    false
  end
end
