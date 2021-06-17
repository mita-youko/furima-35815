FactoryBot.define do
  factory :item do
    name              { "アイテム" }
    description       { Faker::Lorem.sentence}
    category_id       { 3 }
    condition_id      { 3 }
    ship_cost_id      { 3 }
    prefecture_id     { 3 }
    ship_date_id      { 3 }
    price             { 300 }
    association :user
  end
end
