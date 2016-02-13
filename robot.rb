class Robot
  ALLOWED_TURNS = %w(N W S E)
  ALLOWED_COMMANDS = %w(L R M)

  attr_accessor :x, :y, :position

  def initialize(x, y, position)
    @x = x.to_i
    @y = y.to_i
    @position = position
  end

  def move(command)
    command = command.upcase
    return false unless ALLOWED_COMMANDS.include?(command)

    (command == 'M') ? walk : turn(command)
  end

  def current_position
    "#{@x} #{@y} #{@position}"
  end

  private

  def walk
    case @position
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

  def turn(command)
    @position = ALLOWED_TURNS[ next_position_index(command) ]
  end

  def next_position_index(command)
    curr_index = ALLOWED_TURNS.index(@position)

    return (curr_index == 0) ? 3 : (curr_index - 1) if command == 'L'

    (curr_index == 3) ? 0 : (curr_index + 1)
  end
end