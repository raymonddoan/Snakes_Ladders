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

  context '#current_position' do
    subject { described_class.new }
    xit 'should update the players position' do
    end
  end

end