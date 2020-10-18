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

  def fish
  end

  private

  def fetch_game
    @game = Game.find(params[:id])
  end

  def fetch_players
    @players = Player.where(id: params[:player_ids])
  end
end
