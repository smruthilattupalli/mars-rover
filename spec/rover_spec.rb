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

  it 'Can turn left' do
    rover = Rover.new(%w[3 4 N], plateau)
    rover.turn_left
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '3 4 W'
    expect(actual).to eq(expected)
  end

  it 'Can turn right' do
    rover = Rover.new(%w[4 3 E], plateau)
    rover.turn_right
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '4 3 S'
    expect(actual).to eq(expected)
  end

  it 'Can turn opposite direction' do
    rover = Rover.new(%w[4 3 E], plateau)
    rover.turn_right
    rover.turn_right
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction}"
    expected = '4 3 W'
    expect(actual).to eq(expected)
  end
end
