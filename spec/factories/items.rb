FactoryBot.define do
  factory :item do
    item_name          {"商品"}
    item_text          {Faker::Lorem.sentence}
    amount_of_money    {Faker::Number.between(from: 300, to: 9999999)}
    category_id        {2}
    condition_id       {2}
    delivery_charge_id {2}
    area_id            {2}
    number_of_day_id   {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
