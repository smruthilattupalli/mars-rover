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

describe 'Rover :: Can change direction', :rover do
  plateau = Plateau.new(%w[7 7])

  it "Can turn left from 'N' to 'W'" do
    rover = Rover.new(%w[3 4 N], plateau)
    rover.turn_left
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '3 4 W'
    expect(actual).to eq(expected)
  end

  it "Can turn right from 'E' to 'S'" do
    rover = Rover.new(%w[4 3 E], plateau)
    rover.turn_right
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '4 3 S'
    expect(actual).to eq(expected)
  end

  it "Can turn opposite direction from 'E' to 'W'" do
    rover = Rover.new(%w[4 3 E], plateau)
    rover.turn_right
    rover.turn_right
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '4 3 W'
    expect(actual).to eq(expected)
  end
end

describe 'Rover :: Can Move', :rover do
  plateau = Plateau.new(%w[6 6])

  it "Can move north from '3 5 N' to '3 6 N'" do
    rover = Rover.new(%w[3 5 N], plateau)
    rover.move
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '3 6 N'
    expect(actual).to eq(expected)
  end

  it "Can move south from '2 4 S' to '2 3 S'" do
    rover = Rover.new(%w[2 4 S], plateau)
    rover.move
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '2 3 S'
    expect(actual).to eq(expected)
  end

  it "Can move west from '2 4 W' to '1 4 W'" do
    rover = Rover.new(%w[2 4 W], plateau)
    rover.move
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '1 4 W'
    expect(actual).to eq(expected)
  end

  it "Can move east from '5 3 E' to '6 3 E'" do
    rover = Rover.new(%w[5 3 E], plateau)
    rover.move
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '6 3 E'
    expect(actual).to eq(expected)
  end
end
