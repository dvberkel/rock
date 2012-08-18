require 'bag'
require 'piece'

describe "A Bag" do
  it "should not hold any piece at the start" do
    bag = Bag.new()

    # do nothing
    
    bag.size.should eq(0)
  end

  it "should hold pieces" do
    bag = Bag.new()

    bag.insert(Piece.new(:red, :blue, :blue, :red))

    bag.size.should eq(1)
  end

  it "should be able find piece of a certain color" do
    bag = Bag.new()
    piece = Piece.new(:red, :blue, :blue, :red)
    bag.insert(piece)
    bag.insert(Piece.new(:red, :yellow, :yellow, :red))

    pieces = bag.pieces_like(:blue).collect {|piece| piece}

    pieces.should include(piece)
  end

  it "should be able to take a certain piece" do
    bag = Bag.new()
    piece = Piece.new(:red, :blue, :blue, :red)
    bag.insert(piece)

    bag.take(piece)
    pieces = bag.pieces_like(:blue).collect {|piece| piece}

    pieces.size.should eq(0)
  end
end

describe "A MarkTree" do
  it "should be able to add a piece" do
    expected =  [Piece.new(:red, :blue, :red, :blue)]
    tree = MarkTree.new()
    expected.each {|piece| tree.add(piece)}

    pieces = tree.collect {|piece| piece}
    
    expected.each do |expected_piece|
      pieces.should include(expected_piece)
    end
  end

  it "should be able to retrieve a piece" do
    expected =  [Piece.new(:red, :blue, :red, :blue), Piece.new(:yellow, :yellow, :blue, :blue)]
    tree = MarkTree.new()
    expected.each {|piece| tree.add(piece)}
    tree.add(Piece.new(:yellow, :yellow, :red, :red))

    pieces = tree.pick(:blue).collect {|piece| piece}
    
    expected.each do |expected_piece|
      pieces.should include(expected_piece)
    end
  end

  it "should be able to retrieve a more specific piece" do
    expected =  [Piece.new(:red, :blue, :red, :blue), Piece.new(:yellow, :yellow, :blue, :blue)]
    tree = MarkTree.new()
    expected.each {|piece| tree.add(piece)}
    tree.add(Piece.new(:yellow, :yellow, :red, :red))

    pieces = tree.pick(:blue, :red).collect {|piece| piece}
    
    expected.slice(0, 1).each do |expected_piece|
      pieces.should include(expected_piece)
    end
  end

end
