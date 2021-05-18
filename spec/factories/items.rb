FactoryBot.define do
  factory :item do
    nihongo = Gimei.name

    title        { nihongo }
    price        { Faker::Number.within(range: 300..9_999_999) }
    catch_copy   { nihongo }
    category_id  { Faker::Number.within(range: 1..10) }
    condition_id { Faker::Number.within(range: 1..6) }
    fee_id       { Faker::Number.within(range: 1..2) }
    area_id      { Faker::Number.within(range: 1..47) }
    days_id      { Faker::Number.within(range: 1..3) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test.jpg'), filename: 'test.jpg')
    end
  end
end
