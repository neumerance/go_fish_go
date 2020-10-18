require 'rails_helper'

describe Game::Start do
  subject { described_class.run(payload) }

  let(:game) { create(:game, :with_players) }
  let(:payload) do
    {
      game: game
    }
  end

  context 'valid' do
    before { subject }

    it 'sets to in progress' do
      expect(game.reload.in_progress).to be_truthy
    end

    it 'create cards' do
      expect(Card.count).to eq 25
    end

    it 'assigns cards to players' do
      game.game_players.each do |game_player|
        expect(game_player.player_on_hand_cards.count).to eq 5
      end
    end
  end

  context 'invalid' do
    let(:game) { create(:game, :with_players, in_progress: true) }

    it { is_expected.to be_invalid }

    it 'returns error' do
      expect(subject.errors.full_messages).to include('game was already been started')
    end
  end
end
