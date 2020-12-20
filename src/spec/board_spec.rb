require './lib/board.rb'

RSpec.describe Board do

  describe "#end_board" do
    context 'when board'
    it "returns the length of the board" do
      expect(subject.end_board).to eq(0)
    end
  end

end


# oldboard = Board.new
# # oldboard.player_landed(1)
# p oldboard.shash
# puts oldboard.setsnakesladders

# newboard = Board.new
