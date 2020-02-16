# frozen_string_literal: true

require_relative '../lib/rover'
require_relative '../lib/plateau'

describe 'Rover :: Initial Position', :rover do
  plateau = Plateau.new(%w[5 5])
  rover = Rover.new(%w[3 2 S], plateau)

  it "Check initial coordinates and direction with '3 2 S'" do
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '3 2 S'
    expect(actual).to eq(expected)
  end

  it "Check plateau limits with '5 5'" do
    actual = "#{rover.plateau.north_limit} #{rover.plateau.east_limit}"
    expected = '5 5'
    expect(actual).to eq(expected)
  end
end
