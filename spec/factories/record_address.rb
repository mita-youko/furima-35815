FactoryBot.define do
    factory :record_address do
      token {"tok_abcdefghijk00000000000000000"}
      postal_code { '123-4567' }
      prefecture_id { 2 }
      city { '東京都' }
      house_number { '1-1' }
      building_name {'青山ハイツ'}
      phone_number { 12345678910 }
      association :item
    end
end