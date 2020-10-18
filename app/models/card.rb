class Card < ApplicationRecord
  validates :value, :image, :suit, :code, presence: true
  validates :code, uniqueness: true
end
