class Game::Start < Game::Base
  attr_accessor :game

  object :game

  validate :game_status

  def execute
    assign_card_deck
    distribute_cards
    game.update(in_progress: true)
  end

  private

  def assign_card_deck
    deck = ::DeckOfCardsService.new.get_new_deck
    game.update(deck_id: deck.dig(:deck_id))
  end

  def distribute_cards
    game.game_players.each do |game_player|
      initial_cards.dig(:cards).each do |card_params|
        PlayerOnHandCard.create(game_player: game_player, card: find_or_create_card(card_params))
      end
    end
  end

  def game_status
    if game.in_progress?
      errors.add(:base, 'game was already been started')
    end
  end

  def initial_cards
    ::DeckOfCardsService.new.draw_card(game.deck_id, 5)
  end
end
