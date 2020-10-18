require 'rails_helper'

describe PlayerOnHandCard, type: :model do
  it { is_expected.to belong_to :game_player }
  it { is_expected.to belong_to :card }
end
