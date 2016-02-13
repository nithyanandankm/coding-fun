require './robot.rb'

class Plateau
  def initialize(top_left, top_right)
    @x = top_left.to_i
    @y = top_right.to_i
  end

  def deploy(x, y, position)
    Robot.new(x, y, position)
  end
end