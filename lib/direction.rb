# frozen_string_literal: true

# Direction class definition
class Direction
  attr_reader :heading

  def initialize(heading)
    @heading = heading
  end

  def north?
    @heading == 'N'
  end

  def south?
    @heading == 'S'
  end

  def west?
    @heading == 'W'
  end

  def east?
    @heading == 'E'
  end

  # Turns 90 degrees left from the given direction
  def turn_left
    case @heading
    when 'W' then @heading = 'S'
    when 'E' then @heading = 'N'
    when 'N' then @heading = 'W'
    when 'S' then @heading = 'E'
    end
  end

  # Turns 90 degrees right from the give direction
  def turn_right
    case @heading
    when 'S' then @heading = 'W'
    when 'W' then @heading = 'N'
    when 'N' then @heading = 'E'
    when 'E' then @heading = 'S'
    end
  end
end
