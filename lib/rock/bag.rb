class Bag
  def initialize()
    @tree = MarkTree.new()
    @pieces = {}
  end

  def insert(piece)
    if !(@pieces.has_key?(piece)) then
      @pieces[piece] = 0
      @tree.add(piece)
    end
    @pieces[piece] += 1
  end

  def take(piece)
    if (@pieces.has_key?(piece) && @pieces[piece] > 0) then
      @pieces[piece] -= 1
    end
  end

  def size()
    @pieces.size
  end

  def pieces_like(*marks)
    @tree.pick(marks).select {|piece| @pieces[piece] > 0}
  end
end

class MarkTree
  include Enumerable

  def initialize()
    @pieces = []
    @sub_trees = {}
  end

  def add(piece)
    Rotations.of(piece.sides).each do |trail|
      branch_of(trail, piece)
    end
  end

  def branch_of(trail, piece)
    if (trail.empty?) then
      if !(@pieces.include?(piece)) then
        @pieces << piece
      end
    else
      head = trail[0]
      if !(@sub_trees.has_key?(head)) then
        @sub_trees[head] = MarkTree.new()
      end
      @sub_trees[head].branch_of(trail.slice(1,trail.size), piece)
    end
  end

  def pick(*trail)
    trail.flatten!
    if (trail.empty?) then
      return self
    else
      head = trail[0]
      if !(@sub_trees.has_key?(head)) then
        @sub_trees[head] = MarkTree.new()
      end
      return @sub_trees[head].pick(trail.slice(1,trail.size))
    end
  end

  def each
    @pieces.each {|piece| yield piece}
    @sub_trees.each_value do |sub_tree|
      sub_tree.each {|piece| yield piece}
    end
  end
end
