FactoryBot.define do
  factory :card do
    code { '3S' }
    image { 'https://deckofcardsapi.com/static/img/3S.png' }
    value { '3' }
    suit { 'SPADES' }

    trait :c3s do
      code { '3S' }
      image { 'https://deckofcardsapi.com/static/img/3S.png' }
      value { '3' }
      suit { 'SPADES' }
    end

    trait :c3d do
      code { '3D' }
      image { 'https://deckofcardsapi.com/static/img/3D.png' }
      value { '3' }
      suit { 'DIAMOND' }
    end

    trait :c3c do
      code { '3C' }
      image { 'https://deckofcardsapi.com/static/img/3C.png' }
      value { '3' }
      suit { 'CLUBS' }
    end

    trait :c3h do
      code { '3H' }
      image { 'https://deckofcardsapi.com/static/img/3H.png' }
      value { '3' }
      suit { 'HEARTS' }
    end
  end
end
