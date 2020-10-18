require 'rails_helper'

describe Game::Create do
  subject { described_class.run(payload) }

  let(:payload) do
    {
      players: create_list(:player, 5)
    }
  end

  it 'creates' do
    expect { subject }.to change { Game.count }.by(1)
    expect(subject.game.game_players.count).to eq 5
  end

  describe 'invalid' do
    let(:payload) do
      {
        players: create_list(:player, 1)
      }
    end

    it { is_expected.to be_invalid }

    it 'has errors' do
      expect(subject.errors.full_messages).to include('Players at least 2 player is required.')
    end
  end

  describe 'valid' do
    it { is_expected.to be_valid }

    it 'has errors' do
      expect(subject.errors.full_messages).to be_empty
    end
  end
end
