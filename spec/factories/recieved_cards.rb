FactoryBot.define do
  factory :recieved_card do
    association :game_player
    association :card
  end
end
