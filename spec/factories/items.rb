FactoryBot.define do
  factory :item do
    name{Faker::Name.name}
    text{Faker::Lorem.sentence}
    category_id{Faker::Number.between(from: 2, to: 11)}
    status_id{Faker::Number.between(from:2, to:7)}
    delivery_method_id{Faker::Number.between(from:2, to:3)}
    delivery_area_id{Faker::Number.between(from:2, to:48)}
    delivery_day_id{Faker::Number.between(from:2, to:4)}
    price{Faker::Number.between(from:300, to:9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end