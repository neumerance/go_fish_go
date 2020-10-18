FactoryBot.define do
  factory :game do
    deck_id { DeckOfCardsService.new.get_new_deck.dig(:deck_id) }

    trait :with_players do
      after :create do |game|
        5.times do
          create(:game_player, game: game)
        end
      end
    end
  end
end
