# frozen_string_literal: true

require_relative '../lib/direction'

describe 'Direction :: Check if rover heading is valid' do
  it 'Check if direction is north' do
    direction = Direction.new('N')
    expect(direction.north?).to eq(true)
  end

  it 'Check if direction is south' do
    direction = Direction.new('S')
    expect(direction.south?).to eq(true)
  end

  it 'Check if direction is west' do
    direction = Direction.new('W')
    expect(direction.west?).to eq(true)
  end

  it 'Check if direction is east' do
    direction = Direction.new('E')
    expect(direction.east?).to eq(true)
  end
end

describe 'Direction :: Can rotate heading' do
  it "Can turn left from 'N' to 'W'" do
    direction = Direction.new('N')
    direction.turn_left
    actual = direction.heading
    expect(actual).to eq('W')
  end

  it "Can turn right from 'E' to 'S'" do
    direction = Direction.new('E')
    direction.turn_right
    actual = direction.heading
    expect(actual).to eq('S')
  end

  it "Can turn opposite direction from 'E' to 'W'" do
    direction = Direction.new('E')
    direction.turn_right
    direction.turn_right
    actual = direction.heading
    expect(actual).to eq('W')
  end
end
