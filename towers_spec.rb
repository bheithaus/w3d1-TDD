require 'rspec'
require './towers.rb'

describe "Towers of Hanoi" do
  subject(:game) {TOH.new}
  before.each { let(:piles) { game.instance_variable_get(:@piles) } }

  describe "initialize towers game" do
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
    it "raises error if pile is empty" do
      expect do

      end.to raise_error("cannot take from empty pile")
    end

    it "raises error if illegal move" do
      expect do

      end.to raise_error("illegal move")
    end

    it "should call valid_move?" do
      game.should_receive(:valid_move?)
      game.move_disc(0, 1) ## set up a game with piles
    end

    it "moves disc from old pile to new pile" do
      piles_copy = piles.dup
      game.move_disc(0,1)
      piles_copy[0][-1].should == piles[1][-1]
      piles_copy[0].size.should == piles[0].size-1
    end
  end

  describe "valid_move?" do
    it "returns false if from pile is empty" do
      game.valid_move?(1,2).should be_false
    end

    it "returns false if moving larger disc onto smaller disc" do
      game.move_disc(0, 1)
      game.move_disc(0, 2)
      game.valid_move?(2,1).should be_false
    end

    it "returns true if moving smaller disc onto larger disc" do
      game.move_disc(0, 1)
      game.valid_move?(0,1).should be_true
    end

  end

  describe "win? method" do

    it "return false if first pile is not empty" do
      let(:game) {TOH.new([[1], [3,2], []])}
      game.win?.should == false
    end

    it "return false if only one pile has discs that are out of order" do
      let(:game) {TOH.new([[],[3,1,2],[])}
      game.win?.should == false
    end

    it "return false if more than one pile has discs" do
      let(:game) {TOH.new([[],[2,1],[3]])}
      game.win?.should == false
    end

    it "return true if only one pile has discs in order" do
      let(:game) {TOH.new([[],[3,2,1],[])}
      game.win?.should == true
    end



  end
end
 ##initialize

## move disc

##
