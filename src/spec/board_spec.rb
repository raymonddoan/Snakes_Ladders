require './lib/board.rb'

RSpec.describe Board do

  context "#end_board" do
    subject { described_class.new }
    
    it "returns the length of the board" do
      expect(subject.end_board).to eq(0)
    end
  end

end

