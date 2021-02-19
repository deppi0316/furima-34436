FactoryBot.define do
  factory :user do
    
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'test1234TEST'}
    password_confirmation {password}
    last_name_kanji {'山田'}
    first_name_kanji {'太郎'}
    last_name_kana {'ヤマダ'}
    first_name_kana {'タロウ'}
    birthday {Faker::Date.backward}

  end
end
