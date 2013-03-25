# Towers of Hanoi
#
# Write a Towers of Hanoi game.
#
# Keep three arrays, which represents the piles of discs. Pick a representation of the discs to store in the arrays; maybe just a number representing their size.
#
# In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.
#
# After each move, check to see if they have succeeded in moving all the discs, to the final pile. If so, they win!
#

class TOH
  attr_reader :piles

  def initialize(piles = [[3, 2, 1], [], []])
    @piles = piles
  end

  def move_disc(from, to)
    raise "illegal move" unless valid_move?(from, to)
    @piles[to].push(@piles[from].pop)
  end

  def valid_move?(from, to)
    if @piles[from].empty?
      return false
    elsif @piles[to].empty?
      return true
    else
      @piles[from][-1] < @piles[to][-1]
    end
  end

  def win?
    if !@piles[0].empty? || @piles.select { |p| p.size > 0 }.length > 1
      return false
    end
    pile = @piles.select { |p| p.size > 0 }.flatten

    pile == pile.sort.reverse
  end
end
