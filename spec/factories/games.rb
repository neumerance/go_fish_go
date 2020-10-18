FactoryBot.define do
  factory :game do

    trait :with_players do
      after :create do |game|
        5.times do
          create(:game_player, game: game)
        end
      end
    end
  end
end
