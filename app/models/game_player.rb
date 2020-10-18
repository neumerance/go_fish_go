class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :player
  has_many :player_on_hand_cards
  has_many :cards, through: :player_on_hand_cards
  has_many :card_requests
end
