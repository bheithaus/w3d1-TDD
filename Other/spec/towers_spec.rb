require 'rspec'
require './towers.rb'
#very thoru tests
describe "Towers of Hanoi" do
  subject(:game) {TOH.new} #great use of subject

  describe "initialize towers game" do
    it "creates three array pile" do
      game.piles.count.should == 3
    end

    it "fills one pile with discs, other piles empty" do
      game.piles[0].count.should == 3
      (game.piles[1..-1].all? { |pile| pile.empty? }).should be_true
    end

    it "adds discs in ascending order" do #disc size larger
      game.piles[0].should == game.piles[0].sort.reverse
    end
  end

  describe "move disc" do
    it "raises error if illegal move" do
      expect do
        game.move_disc(0, 1)
        game.move_disc(0, 2)
        game.move_disc(2, 1)
      end.to raise_error("illegal move")
    end

    it "moves disc from old pile to new pile" do
      disc = game.piles[0][-1]
      height = game.piles[0].count
      game.move_disc(0,1)
      disc.should == game.piles[1][-1]
      game.piles[0].count.should == height - 1
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
      game.valid_move?(1,0).should be_true
    end
  end

  describe "win? method" do
    it "return false if first pile is not empty" do
      game = TOH.new([[1], [3,2], []])
      game.win?.should == false
    end

    it "return false if only one pile has discs and they are out of order" do
      game = TOH.new([[],[3,1,2],[]])
      game.win?.should == false
    end

    it "return false if more than one pile has discs" do
      game = TOH.new([[],[2,1],[3]])
      game.win?.should == false
    end

    it "return true if only one pile has discs in order" do
      game = TOH.new([[],[3,2,1],[]])
      game.win?.should == true
    end
  end
end

#
# REV: Another great example. Confirming that the final tower is in order is unnecessary concidering
#      your move validation won't allow them to ever be placed out of order but it's a thorough RSpec.
#      
