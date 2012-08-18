require "space"
require "piece"

describe "A Space" do
  it "should determine feasabillity of solution" do
    origin = Space.new(:a, :b, :c)
    space = Space.new(:d, :e)
    origin.from(:a).to(space).via(:e)
    
    origin.place(Piece.new(:red, :blue, :yellow))
    space.place(Piece.new(:yellow, :red))

    origin.feasible?.should eq(true)
  end

  it "should determine infeasabillity of solution" do
    origin = Space.new(:a, :b)
    space = Space.new(:c, :d)
    origin.from(:a).to(space).via(:c)
    
    origin.place(Piece.new(:red, :blue))
    space.place(Piece.new(:blue, :red))

    origin.feasible?.should eq(false)
  end

  it "should only accept pieces of correct size" do
    expect { Space.new(:a, :b, :c).place(Piece.new(:red, :blue))}.to raise_error
    expect { Space.new(:a, :b).place(Piece.new(:red, :blue, :yellow))}.to raise_error
  end

  it "should only connect from sides" do
    expect {Space.new(:a).from(:b)}.to raise_error
  end

  it "should only connect via sides" do
    expect {Space.new(:a).from(:a).to(Space.new(:b)).via(:a)}.to raise_error
  end
end
