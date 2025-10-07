FactoryBot.define do
  factory :unit do
    sequence(:name) { |n| "Test Unit #{n}" }
    sequence(:mul_id) { |n| 1000 + n }
    variant { "Test Variant" }
    association :unit_type

    trait :mech do
      association :unit_type, :mech
      name { "Atlas" }
      variant { "AS7-D" }
    end

    trait :battle_armor do
      association :unit_type, :battle_armor
      name { "Elemental Battle Armor" }
      variant { "[Laser](Sqd5)" }
    end

    trait :vehicle do
      association :unit_type, :vehicle
      name { "Scorpion Light Tank" }
      variant { "Standard" }
    end
  end
end
