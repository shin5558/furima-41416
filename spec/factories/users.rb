FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "a1#{Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false)}" }
    password_confirmation { password }
    # mix_case: true 大文字小文字混ぜる special_characters: false きごうを含めない

    # 日本語の名字・名前
    last_name { Faker::Japanese::Name.last_name }
    first_name { Faker::Japanese::Name.first_name }

    # カタカナの名字・名前
    last_name_kana { Faker::Japanese::Name.last_name.yomi }
    first_name_kana { Faker::Japanese::Name.first_name.yomi }

    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) } # 18歳〜65歳のランダムな誕生日
  end
end
