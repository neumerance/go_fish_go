class GamesController < ApplicationController
  before_action :fetch_game, only: [:show, :start]

  api :POST, '/games'
  param :player_ids, Array, desc: 'Array of players IDs that will join the new game'
  def create
    interactor = Game::Create.run({ players: @players })
    render json: interactor.game
  end

  api :POST, '/games/:id'
  param :id, Integer, desc: 'Game ID'
  def show
    render json: @game
  end

  api :GET, '/games/:id/start'
  param :id, Integer, desc: 'Game ID'
  def start
    interactor = Game::Start.run({ game: @game })
    render status: :ok
  end

  api :GET, '/games/:id/fish'
  param :id, Integer, desc: 'Game ID'
  param :game_player_id, Integer, desc: 'Game Player ID requesting for a card'
  param :target_game_player_id, Integer, desc: 'Target Game Player ID requested for a card'
  param :card_value, Integer, desc: 'Request card value'
  def fish
    interactor = Game::Fish.run({
      game: @game,
      current_game_player: GamePlayer.find(params[:game_player_id]),
      game_player: GamePlayer.find(params[:target_game_player_id]),
      card_value: params[:card_value]
    })
    render status: :ok
  end

  private

  def fetch_game
    @game = Game.find(params[:id])
  end

  def fetch_players
    @players = Player.where(id: params[:player_ids])
  end
end
