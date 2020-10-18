class Game::Base < ActiveInteraction::Base
  MIN_PLAYER = 2.freeze

  attr_accessor :game

  array :players

  validate :number_of_players

  def execute
    create_game
    join_players
    self
  end

  private

  def join_players
    players.each do |player|
      GamePlayer.create(game: game, player: player)
    end
  end

  def create_game
    @game = Game.create
  end

  def number_of_players
    errors.add(:players, 'at least 2 player is required.') if players.count < MIN_PLAYER
  end
end
