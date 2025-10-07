FactoryBot.define do
  factory :unit_type do
    name { "mechs" }

    trait :mech do
      name { UnitType::MECH }
    end

    trait :battle_armor do
      name { UnitType::BATTLE_ARMOR }
    end

    trait :vehicle do
      name { UnitType::VEHICLE }
    end

    trait :infantry do
      name { UnitType::INFANTRY }
    end
  end
end
