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

  it "should be able piece of a certain color" do
    bag = Bag.new()
    piece = Piece.new(:red, :blue, :blue, :red)
    bag.insert(piece)
    bag.insert(Piece.new(:red, :yellow, :yellow, :red))

    pieces = bag.pieces_like(:blue).collect {|piece| piece}

    pieces.should include(piece)
  end
end
