FactoryBot.define do
  factory :card_request do
    association :game_player
    association :card
  end
end
