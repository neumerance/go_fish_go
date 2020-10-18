require 'rails_helper'

describe DeckOfCardsService do
  subject { described_class.new }

  describe '#get_new_deck' do
    it 'returns new deck' do
      expect(subject.get_new_deck.keys).to eq([:success, :deck_id, :remaining, :shuffled])
    end
  end
end
