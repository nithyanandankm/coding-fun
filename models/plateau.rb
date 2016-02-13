require_relative './robot.rb'

# Plateau class represents the rectangular area of mars
# The area is formed by (botttom-left, bottom-right) and (top-left, top-right) coordinates.

# For the scope of this program, we are assuming (botttom-left, bottom-right) as always (0, 0)
# (top-left, top-right) are provided by end user.

class Plateau
  def initialize(top_left, top_right)
    @x = top_left.to_i
    @y = top_right.to_i

    # Assuming that bottom-left and bottom-right coordinates are (0, 0)
    # top-left should be >= 0 and top-right should be >= 1
    fail 'Please enter top_left coordinate as >= 0 and and top_right as >= 1' if @x < 0 || @y < 1
  end

  def deploy(x, y, position)
    x = x.to_i
    y = y.to_i

    # Basic checks to ensure that the Robot is being deployed within the rectangular block.
    fail "Positioning should be within the scope of the rectangle represented by (0, 0) and (#{@x}, #{@y}) coordinates" if
      x < 0 || y < 0 || x > @x || y > @y

    Robot.new(x, y, position)
  end
end