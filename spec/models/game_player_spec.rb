require 'rails_helper'

describe GamePlayer, type: :model do
  it { is_expected.to belong_to :game }
  it { is_expected.to belong_to :player }
  it { is_expected.to have_many :cards }
  it { is_expected.to have_many :card_requests }
end
