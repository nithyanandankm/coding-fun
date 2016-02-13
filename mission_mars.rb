require './plateau.rb'

system('clear')
puts 'Welcome to the Mars Mission.'

print 'Enter the Upper-right coordinates of the Plateau in \'x y\' format eg: 5 5: '
plateau_coord = gets.split(/\s/)
px, py = plateau_coord[0..1].map { |coord| coord.to_i }

plateau = Plateau.new(px, py)

puts ''
print 'Enter the position where you want to deploy the Robot in \'x y direction\' eg: 1 2 N: '
robot_coord = gets.split(/\s/)
rx, ry, rd = robot_coord[0..2]

robot = plateau.deploy(rx, ry, rd)

puts ''
print 'Enter the Robot movements:'
robot_moves = gets.split(//)
robot_moves.each { |cmd| robot.move(cmd) }

puts ''
print 'Current Position of the robot is: ' + robot.current_position
puts ''