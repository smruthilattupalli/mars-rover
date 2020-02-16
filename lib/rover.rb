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

  def turn_left
    case @direction
    when 'W' then @direction = 'S'
    when 'E' then @direction = 'N'
    when 'N' then @direction = 'W'
    when 'S' then @direction = 'E'
    end
  end

  def turn_right
    case @direction
    when 'S' then @direction = 'W'
    when 'W' then @direction = 'N'
    when 'N' then @direction = 'E'
    when 'E' then @direction = 'S'
    end
  end
end
