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

  def execute_instructions(instructions)
    instructions.each_char do |instruction|
      case instruction
      when 'L' then turn_left
      when 'R' then turn_right
      when 'M' then move
      end
    end
  end

  def east_move_allowed?
    @direction == 'E' && @x_position < @plateau.east_limit
  end

  def west_move_allowed?
    @direction == 'W' && @x_position > @plateau.west_limit
  end

  def north_move_allowed?
    @direction == 'N' && @y_position < @plateau.north_limit
  end

  def south_move_allowed?
    @direction == 'S' && @y_position > @plateau.south_limit
  end

  private

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

  def move
    @x_position += 1 if east_move_allowed?
    @x_position -= 1 if west_move_allowed?
    @y_position += 1 if north_move_allowed?
    @y_position -= 1 if south_move_allowed?
  end
end
