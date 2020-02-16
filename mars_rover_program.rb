# frozen_string_literal: true

require_relative 'lib/plateau'
require_relative 'lib/rover'

input = File.open('lib/input.txt')
output = File.open('lib/output.txt', 'w')

input_lines = File.readlines(input)

# first line of the input file are plateau coordinates
plateau_limits = input_lines[0].split
plateau = Plateau.new(plateau_limits)
# delete the plateau limit
input_lines.delete_at(0)

# slice input into groups of 2: starting position & instructions for each rover
# [[rover1_pos, rover1_instructions], [rover2_pos, rover2_instructions]]
rovers = input_lines.each_slice(2).to_a

rovers.each_with_index do |rover_info, index|
  puts "Final co-ordinates of Rover #{index + 1} :"

  rover = Rover.new(rover_info[0].split, plateau) # rover initial position
  rover.execute_instructions(rover_info[1]) # rover instructions

  # write the final position of the rover to the output file
  output.write "#{rover.x_position} #{rover.y_position} #{rover.direction}\n"
  puts "#{rover.x_position} #{rover.y_position} #{rover.direction}"
  puts '-------------------------------------------'
end
