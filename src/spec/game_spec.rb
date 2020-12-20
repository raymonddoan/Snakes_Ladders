require './lib/game.rb'

RSpec.describe Game do
  let(:game) {described_class.new}

  describe '#initialize' do
    # let(:input) { "ray" }

    xit 'receives the user\'s input and prints out a line of text with the player\'s name' do
      # $stdin = input
      expect(game).to output(
        "Welcome to Snakes and Ladders - the only game you will ever want to play ! Let's get started. "
      )
    end
  end

end