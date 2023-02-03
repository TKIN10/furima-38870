FactoryBot.define do
  factory :purchase_information_shipping_address do
    postal_code  {'123-4567'}
    area_id      {2}
    municipality {'郡山市'}
    adress       {'1-1'}
    bulding_name {'東京ドーム'}
    number       {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
