# Represents a Robot which can be deployed on plateau of mars
#
# = Usage
# Robot.new(x, y, direction)
#  x : represents the x coordinate of the location to deploy
#  y : represents the y coordinate of the location to deploy
#  direction : represents the direction Robot should be facing on deployment
#
# = Supported methods
#  move : to move the robot around the plateau
#  current_position : returns the current position in a string format
#

class Robot
  ALLOWED_TURNS = %w(N W S E)
  ALLOWED_COMMANDS = %w(L R M)

  attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x.to_i
    @y = y.to_i
    @direction = direction
  end

  # Takes care of Robot movement
  # .move(L) : makes the robot turn left 90 degree of current direction
  # .move(R) : makes the robot turn right 90 degree of current direction
  # .move(M) : makes the robot to move one grid in the current direction
  def move(command)
    command = command.upcase
    return false unless ALLOWED_COMMANDS.include?(command)

    (command == 'M') ? walk : turn(command)
  end

  def current_position
    "#{@x} #{@y} #{@direction}"
  end

  private

  # Enables the Robot to move in the current direction.
  def walk
    case @direction
      when 'N'
        @y += 1
      when 'W'
        @x += 1
      when 'S'
        @y -= 1
      when 'E'
        @x -= 1
    end
  end

  # Enables the Robot to rotate 90 degree left/right
  def turn(command)
    @direction = ALLOWED_TURNS[ next_position_index(command) ]
  end

  def next_position_index(command)
    curr_index = ALLOWED_TURNS.index(@direction)

    return (curr_index == 0) ? 3 : (curr_index - 1) if command == 'L'

    (curr_index == 3) ? 0 : (curr_index + 1)
  end
end