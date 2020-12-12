require_relative '../lib/dice'

describe Dice do
  it 'provides a number between 1 and 6' do
    expect(Dice.roll_die()).to satisfy { |v| v < 6 }
  end
end