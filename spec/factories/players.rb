FactoryBot.define do
  factory :player do
    name { FFaker::Name.name }
  end
end
