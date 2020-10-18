class Game::Base < ActiveInteraction::Base
  private

  def find_or_create_card(params)
    Card.find_or_create_by(
      value: params.dig(:value),
      image: params.dig(:image),
      suit: params.dig(:suit),
      code: params.dig(:code)
    )
  end
end