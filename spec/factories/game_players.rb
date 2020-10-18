FactoryBot.define do
  factory :game_player do
    association :game
    association :player
  end
end
