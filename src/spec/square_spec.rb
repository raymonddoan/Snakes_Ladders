require './lib/square.rb'

RSpec.describe Square do
  
  context '#initialize' do
    context 'when creating a square' do
      subject { described_class.new(0) }

      it 'there is no player on it' do
        expect(subject.player).to be(false)
      end
    end
  end

  context '#landed' do
    context 'A square' do
      subject { described_class.new(0) }

      context 'that a player lands on' do
        it 'flags true' do
          expect(subject.landed(0)).to be(true)
        end
      end
    end
  end


end