class Game::Fish < Game::Base
  attr_accessor :game

  object :game
  object :current_game_player, class: GamePlayer
  object :game_player
  string :card_value

  validate :requested_card

  def execute
    on_hand_cards = fish_on_player ? fish_on_player : fish_on_deck
    if fish_on_player
      on_hand_cards.each do |on_hand_card|
        on_hand_card.update(game_player: current_game_player)
      end
    end
  end

  private

  def requested_card
    cards = current_game_player.player_on_hand_cards.joins(:card).where('cards.value = ?', card_value)
    errors.add(:card_code, 'does not exists in current players on hand cards') unless cards.any?
  end

  def fish_on_player
    game_player.player_on_hand_cards.joins(:card).where('cards.value = ?', card_value)
  end

  def fish_on_deck
    deck = ::DeckOfCardsService.new.draw_card(game.deck_id, 1)
    card_params = deck.dig(:cards).first
    raise 'Check game' unless card_params.present?
    PlayerOnHandCard.create(game_player: current_game_player, card: find_or_create_card(card_params))
  end
end
