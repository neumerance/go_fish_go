require 'rails_helper'

describe Game, type: :model do
  it { is_expected.to have_many :game_players }
  it { is_expected.to have_many :players }
end
