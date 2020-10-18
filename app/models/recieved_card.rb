class RecievedCard < ApplicationRecord
  belongs_to :game_player
  belongs_to :card

  scope :recievable, -> { where(recieved: false) }
end
