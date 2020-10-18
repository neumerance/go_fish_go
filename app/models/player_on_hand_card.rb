class PlayerOnHandCard < ApplicationRecord
  belongs_to :game_player
  belongs_to :card
end
