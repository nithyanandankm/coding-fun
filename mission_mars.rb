require './models/plateau.rb'

system('clear')
puts 'Welcome to the Mars Mission.'

print 'Enter the Upper-right coordinates of the Plateau in \'x y\' format(eg: 5 5): '
plateau_coord = gets.split(/\s/)
px, py = plateau_coord[0..1].map { |coord| coord.to_i }

begin
  plateau = Plateau.new(px, py)
rescue => exc
  puts exc.message
  exit(0)
end

puts ''
print 'Enter the number of robots you want to deploy: '
total_robots = gets.to_i
rovers = []

total_robots.times do
  puts ''
  print 'Enter the position to deploy the Robot in \'x y direction\' format(eg: 1 2 N): '
  robot_coord = gets.split(/\s/).reject { |val| val.to_s.strip == '' }
  rx, ry, rd = robot_coord[0..2]

  robot = plateau.deploy(rx, ry, rd)

  puts ''
  print 'Enter the Robot movements: '

  robot_moves = gets.split(//)
  rovers << [robot, robot_moves]
end

rovers.each_with_index do |rover, index|
  robot, moves = rover
  moves.each { |cmd| robot.move(cmd) }

  puts ''
  print "Position of robot #{ index + 1 } is: #{ robot.current_position }"
  puts ''
end
