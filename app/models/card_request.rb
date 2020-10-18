class CardRequest < ApplicationRecord
  belongs_to :game_player
  belongs_to :card

  scope :requested, -> { where(complied: false) }
end
