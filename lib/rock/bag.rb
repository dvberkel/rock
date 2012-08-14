class Bag
  def initialize()
    @pieces = {}
  end

  def insert(piece)
    if !(@pieces.has_key?(piece)) then
      @pieces[piece] = 0
    end
    @pieces[piece] += 1
  end

  def size()
    @pieces.size
  end

  def pieces_like(*marks)
    @pieces.keys
  end
end
