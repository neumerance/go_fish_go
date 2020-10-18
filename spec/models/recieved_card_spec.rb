require 'rails_helper'

describe RecievedCard, type: :model do
  it { is_expected.to belong_to :game_player }
  it { is_expected.to belong_to :card }

  describe 'scopes' do
    describe '#recievable' do
      subject { described_class.recievable }
      let!(:recieved_card) { create(:recieved_card) }

      context 'active recievable' do
        it 'includes recieved card' do
          expect(subject).to include(recieved_card)
        end
      end

      context 'recieved card' do
        before { recieved_card.update(recieved: true) }

        it 'returns empty' do
          expect(subject).to be_empty
        end
      end
    end
  end
end
