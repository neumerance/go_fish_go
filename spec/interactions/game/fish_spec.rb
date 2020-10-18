require 'rails_helper'

describe Game::Fish do
  subject { described_class.run(payload) }

  let(:game) { create(:game, :with_players, in_progress: true) }
  let(:player_1) { game.game_players.first }
  let(:player_2) { game.game_players.second }
  let(:c3s) { create(:card, :c3s) }
  let(:c3d) { create(:card, :c3d) }
  let(:c3c) { create(:card, :c3c) }
  let(:c3h) { create(:card, :c3h) }

  before do
    player_1.player_on_hand_cards << create(:player_on_hand_card, game_player: player_1, card: c3s)
    player_1.player_on_hand_cards << create(:player_on_hand_card, game_player: player_1, card: c3d)
    player_2.player_on_hand_cards << create(:player_on_hand_card, game_player: player_1, card: c3c)
    player_2.player_on_hand_cards << create(:player_on_hand_card, game_player: player_1, card: c3h)
  end

  let(:payload) do
    {
      game: game,
      game_player: player_2,
      current_game_player: player_1,
      card_value: '3'
    }
  end

  context 'invalid' do
    let(:payload) do
      {
        game: game,
        game_player: player_2,
        current_game_player: player_1,
        card_value: '4'
      }
    end

    it { is_expected.to be_invalid }
    it 'returns errors' do
      expect(subject.errors.full_messages).to include('Card code does not exists in current players on hand cards')
    end
  end

  context 'valid' do
    it { is_expected.to be_valid }

    it 'player one gets all player 2 similar cards' do
      subject
      expect(player_1.reload.player_on_hand_cards.size).to eq 4
      expect(player_2.reload.player_on_hand_cards.any?).to be_falsey
    end
  end
end