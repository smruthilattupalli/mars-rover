# frozen_string_literal: true

# Plateau class definition
class Plateau
  attr_reader :west_limit, :south_limit, :north_limit, :east_limit

  def initialize(plateau_limits)
    x_limit = plateau_limits[0].to_i
    y_limit = plateau_limits[1].to_i

    @west_limit = 0
    @south_limit = 0
    @east_limit = x_limit
    @north_limit = y_limit
  end
end
