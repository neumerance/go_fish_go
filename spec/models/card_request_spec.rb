require 'rails_helper'

describe CardRequest, type: :model do
  it { is_expected.to belong_to :game_player }
  it { is_expected.to belong_to :card }

  describe 'scopes' do
    describe '#requested' do
      subject { described_class.requested }
      let!(:card_request) { create(:card_request) }

      context 'active request' do
        it 'includes request card' do
          expect(subject).to include(card_request)
        end
      end

      context 'complied request' do
        before { card_request.update(complied: true) }

        it 'returns empty' do
          expect(subject).to be_empty
        end
      end
    end
  end
end
