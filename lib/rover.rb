# frozen_string_literal: true

# Rover class definition
class Rover
  attr_accessor :x_position, :y_position, :direction, :plateau

  def initialize(rover_coordinates, plateau)
    @x_position = rover_coordinates[0].to_i
    @y_position = rover_coordinates[1].to_i
    @direction = rover_coordinates[2]
    @plateau = plateau
  end
end
