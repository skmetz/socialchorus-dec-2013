require_relative '../lib/miracle'
require 'forwardable'

class BottlesSong

  def sing
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|n| verse(n) + "\n"}.join
  end

  def verse(number)
    starting_bottle_num = number.to_bottle_num
    ending_bottle_num   = starting_bottle_num.pred

    "#{starting_bottle_num} of beer on the wall, ".capitalize +
    "#{starting_bottle_num} of beer.\n" +
    "#{starting_bottle_num.action}, " +
    "#{ending_bottle_num} of beer on the wall.\n"
  end
end

