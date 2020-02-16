# frozen_string_literal: true

require_relative '../lib/rover'
require_relative '../lib/plateau'
require_relative '../lib/direction'

describe 'Rover :: Initial Position' do
  plateau = Plateau.new(%w[5 5])
  rover = Rover.new(%w[3 2 S], plateau)

  it "Check initial coordinates and direction with '3 2 S'" do
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction.heading}"
    expected = '3 2 S'
    expect(actual).to eq(expected)
  end

  it "Check plateau limits with '5 5'" do
    actual = "#{rover.plateau.north_limit} #{rover.plateau.east_limit}"
    expected = '5 5'
    expect(actual).to eq(expected)
  end
end

describe 'Rover :: Can Move' do
  plateau = Plateau.new(%w[6 6])

  it "Can move north from '3 5 N' to '3 6 N'" do
    rover = Rover.new(%w[3 5 N], plateau)
    rover.execute_instructions('M')
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction.heading}"
    expected = '3 6 N'
    expect(actual).to eq(expected)
  end

  it "Can move south from '2 4 S' to '2 3 S'" do
    rover = Rover.new(%w[2 4 S], plateau)
    rover.execute_instructions('M')
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction.heading}"
    expected = '2 3 S'
    expect(actual).to eq(expected)
  end

  it "Can move west from '2 4 W' to '1 4 W'" do
    rover = Rover.new(%w[2 4 W], plateau)
    rover.execute_instructions('M')
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction.heading}"
    expected = '1 4 W'
    expect(actual).to eq(expected)
  end

  it "Can move east from '5 3 E' to '6 3 E'" do
    rover = Rover.new(%w[5 3 E], plateau)
    rover.execute_instructions('M')
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction.heading}"
    expected = '6 3 E'
    expect(actual).to eq(expected)
  end
end

describe "Rover :: Cannot move outside the plateau with dimensions '6 6'" do
  plateau = Plateau.new(%w[6 6])

  it "Rover at '6 3 E' cannot cross east limit" do
    rover = Rover.new(%w[6 3 E], plateau)
    rover.execute_instructions('M')
    expect(rover.east_move_allowed?).to be(false)
  end

  it "Rover at '0 3 W' cannot cross west limit" do
    rover = Rover.new(%w[0 3 W], plateau)
    rover.execute_instructions('M')
    expect(rover.west_move_allowed?).to be(false)
  end

  it "Rover at '5 6 N' cannot cross north limit" do
    rover = Rover.new(%w[5 6 N], plateau)
    rover.execute_instructions('M')
    expect(rover.north_move_allowed?).to be(false)
  end

  it "Rover at '6 0 S' cannot cross south limit" do
    rover = Rover.new(%w[6 0 S], plateau)
    rover.execute_instructions('M')
    expect(rover.south_move_allowed?).to be(false)
  end
end

describe 'Rover :: Can follow a series of instructions' do
  plateau = Plateau.new(%w[6 6])

  it "Rover at '2 3 E' reaches '1 4 N'" do
    rover = Rover.new(%w[2 3 E], plateau)
    rover.execute_instructions('LLMRM')
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction.heading}"
    expected = '1 4 N'
    expect(actual).to eq(expected)
  end

  it "Rover at '6 6 E' doesnt cross plateau limits but changes heading" do
    rover = Rover.new(%w[6 6 E], plateau)
    rover.execute_instructions('MMLMM')
    actual = "#{rover.x_position} #{rover.y_position} #{rover.direction.heading}"
    expected = '6 6 N'
    expect(actual).to eq(expected)
  end
end
