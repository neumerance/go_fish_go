class DeckOfCardsService
  include HTTParty
  base_uri 'https://deckofcardsapi.com'

  def get_deck(deck_id)
    esponse = self.class.get("/api/deck/#{deck_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_new_deck
    response = self.class.get("/api/deck/new/shuffle/")
    JSON.parse(response.body, symbolize_names: true)
  end

  def draw_card(deck_id, count)
    response = self.class.get("/api/deck/#{deck_id}/draw/?count=#{count}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
