require 'piece'

describe "A Piece" do
  it "should be identified by its sides" do
    piece = Piece.new(:red, :blue, :red, :blue)

    piece.should eq(Piece.new(:red, :blue, :red, :blue))
  end

  it "should be different from piece with different number of sides" do 
    piece = Piece.new(:red, :blue, :red, :blue)

    piece.should_not eq(Piece.new(:blue, :red, :blue))
  end
end
