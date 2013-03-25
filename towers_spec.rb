require 'rspec'
require './towers.rb'


describe "initialize towers game" do
  subject(:game) {TOH.new}

  let(:piles) { game.instance_variable_get }

  it "creates three array pile" do ##should we expose an instance variable in the class just for testing?
    piles.count.should == 3

  end

  it "fills one pile with discs, other piles empty" do
    piles[0].count.should == 3
    (piles[1..-1].all? { |pile| pile.empty? }).should be_true
  end

  it "adds discs in ascending order" do #disc size larger
    piles[0].should == piles[0].sort.reverse
  end

end


describe "move disc" do
  it "raises error if pile is empty"

  it "raises error if illegal move"

  it "should call valid_move?" ## Question.

  it "moves disc from old pile to new pile"
end

describe "valid_move?" do
  it "returns false if pile is empty" do
  end

  it "returns false if moving larger disc onto smaller disc" do
  end

  it "should take two piles as parameters" do
  end

  it "returns true if moving smaller disc onto larger disc" do
  end

end

describe "win? method" do

  it "return false if first pile is not empty" do

  end

  it "return false if more than one pile has discs"

  it "return true if only one pile has discs and it is in ascending order"

end
 ##initialize

## move disc

##
