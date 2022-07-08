FactoryBot.define do
  factory :purchase_address do
    post_code     {'123-4567'}
    prefecture_id {2}
    city          {'東京都'}
    address       {'1-1'}
    building_name {'東京ハイツ'}
    phone_number  {'00000000000'}
    token         {"tok_abcdefghijk00000000000000000"}

    association :user
    association :item
  end
end