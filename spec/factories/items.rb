FactoryBot.define do
  factory :item do
    product_name      {Faker::Lorem.sentence}
    explanation       {2}
    category_id       {2}
    condition_id      {2}
    price             {"9999"}
    send_cost_id      {2}
    prefecture_id     {2}
    send_day_id       {2}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end