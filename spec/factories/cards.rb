FactoryBot.define do
  factory :card do
    code { '3S' }
    image { 'https://deckofcardsapi.com/static/img/3S.png' }
    value { '3' }
    suit { 'SPADES' }
  end
end
