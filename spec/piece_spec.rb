require 'piece'

describe "A Piece" do
  it "should be identified by its sides" do
    piece = Piece.new(:red, :blue, :red, :blue)

    piece.should eq(Piece.new(:red, :blue, :red, :blue))
  end

  it "should be different from piece with different number of sides" do 
    piece = Piece.new(:red, :blue, :red, :blue)

    piece.should_not eq(Piece.new(:blue, :red, :blue))
    piece.should_not eq(Piece.new(:blue, :red, :blue, :red, :yellow))
  end

  it "should be different from a piece with different sides" do
    piece = Piece.new(:red, :blue, :red, :blue)

    piece.should_not eq(Piece.new(:blue, :yellow, :blue, :yellow))
  end

  it "should be identified with a rotational symmetric piece" do
    piece = Piece.new(:red, :blue, :red, :blue)

    piece.should eq(Piece.new(:blue, :red, :blue, :red))
  end
end

describe "Rotations" do
  it "should generate all the rotations of an array" do
    target = ["a", "b", "c"]
    
    result = []
    Rotations.of(target).each do |rotation|
      result << rotation
    end
    
    result.size().should eq(target.size)
    (0 ... target.size).each do |index| 
      result.should include(target.rotate(index))
    end
  end
end
