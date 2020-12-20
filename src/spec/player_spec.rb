require './lib/player.rb'

RSpec.describe Player do
  
  context '#initialize' do
    context 'when creating a player' do
      subject { described_class.new(name: "Ray") }

      it 'will show the player\'s name' do
        expect(subject.name).to eq("Ray")
      end
    end
  end

  context '#roll' do
    subject { described_class.new(name: "Ray") }
    it 'should receive a value from 1 to 6 from Dice Class' do
      subject.roll
      expect(subject.die_rolls[0].between?(1, 6)).to be(true)
    end
  end

  context '#piece' do
    subject { described_class.new(name: "Ray") }
    it 'should set a piece for the player' do
      subject.color = "green"
      subject.set_piece
      expect(subject.piece).to be_a(String)
    end
  end

end