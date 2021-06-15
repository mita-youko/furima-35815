FactoryBot.define do
    factory :user do
      transient do
        person { Gimei.name }
      end
      nickname              {Faker::Name.name}
      email                 {Faker::Internet.free_email}
      password              {'test1234TEST'}
      password_confirmation {password}
      last_name             {'山田やまだヤマダ'}
      first_name            {'太郎たろうタロウ'}
      last_name_kana        {person.first.katakana}
      first_name_kana       {person.last.katakana}
      birthday_id           {'1920-01-05'}

    end
end