FactoryBot.define do
  factory :user do
    jap_user = Gimei.name

    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 4)
    password { password }
    password_confirmation { password }
    last_name             { jap_user.last.kanji }
    first_name            { jap_user.first.kanji }
    last_name_kana        { jap_user.last.katakana }
    first_name_kana       { jap_user.first.katakana }
    birth                 { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
