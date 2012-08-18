class Space
  def initialize(*sides)
    @piece = Piece.new()
    @sides = sides
    @connections = {}
  end

  def from(side)
    if (!has_side? side) then
      raise "incorrect side"
    end
    Connector.new(self, side)
  end

  def has_side?(side)
    @sides.include? side
  end

  def add(connection)
    @connections[connection.from] = connection
  end

  def place(piece)
    if (size() != piece.size) then
      raise "Incongruent piece for space"
    end
    @piece = piece
  end
  
  def size()
    @sides.size
  end

  def feasible?()
    @connections.each do |side, connection|
      if (mark_on(side) != connection.target.mark_on(connection.via)) then
        return false
      end
    end
    true
  end

  def mark_on(side)
    @piece.mark(@sides.index(side))
  end
end

class Connector
  def initialize(origin, from)
    @origin = origin
    @from = from
  end

  def to(target)
    @target = target
    self
  end

  def via(via)
    if (!@target.has_side? via) then
      raise "incorrect side"
    end
    @origin.add(Connection.new(@from, via, @target))
    @target.add(Connection.new(via, @from, @origin))
  end
end

class Connection
  attr_reader :from, :via, :target
  def initialize(from, via, target)
    @from = from
    @via = via
    @target = target
  end
end
