# frozen_string_literal: true

require_relative '../lib/plateau'

describe "Plateau :: Check Plateau Limits for '4 4'" do
  plateau = Plateau.new(%w[4 4])

  it "Validate west limit '0'" do
    expect(plateau.west_limit).to eq(0)
  end

  it "Validate south limit '0'" do
    expect(plateau.south_limit).to eq(0)
  end

  it "Validate east limit '4'" do
    expect(plateau.east_limit).to eq(4)
  end

  it "Validate north limit '4'" do
    expect(plateau.north_limit).to eq(4)
  end
end
