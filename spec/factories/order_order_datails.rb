FactoryBot.define do
  factory :order_order_datail do
    postal_code {'123-4567'}
    delivery_area_id {Faker::Number.between(from:2, to:48)}
    municipality {'テスト'}
    address {'テスト'}
    building_name {'テスト'}
    phone_number {Faker::Number.between(from:0, to:99999999999)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end