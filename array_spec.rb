require 'rspec'
require './array_work'
# Remove dups
#
# Array has a uniq method that removes duplicates from an array. It returns the unique elements in the order in which they first appeared:
#
# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own uniq method, called my_uniq; it should take in an Array and return a new array. It should not call uniq.
#
# One special feature of Ruby classes is that they are open; we can add new methods to existing classes. Here, add your my_uniq method to Array:
#
# class Array
#   def my_uniq
#     # ...
#   end
# end
# This is also called monkey patching, and it is often frowned upon to, after-the-fact, add new methods to a class. However, it is occasionally useful and interesting to try out.

describe "#my_uniq" do
  let(:arr) { [5,2,7,5,3,4,3] }

  it "returns a subarray with all the uniq items" do
    arr.my_uniq.should == [5,2,7,3,4]
  end

  it "leaves original array intact" do
    original = arr.dup
    arr.my_uniq

    arr.should == original
  end
  ## QUESTION.
  it "extends class Array" do
    pending
  end
end

describe "#two_sum" do
  let(:arr) { [1,2,0,0,0,-2,3,-3,4] }  

  before { let(:arr) { [1,2,0,0,0,-2,3,-3,4] } }

  it "returns true for 1 pair" do
  end

  it "does not return true for only 1 zero" do
  end

  it "returns false for 0 pairs" do
  end

  it "does not change the original array" do
  end

end


# describe "#factors" do
#   # given a number, return an ordered array of its factors.
#
#   it "returns factors of 10 in order" do
#     factors(10).should == [1, 2, 5, 10]
#   end
#
#   it "returns just two factors for primes" do
#     factors(13).should == [1, 13]
#   end
# end
