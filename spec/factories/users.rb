FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    myouji                {'山田'}
    namae                 {'太郎'}
    kanamyouji            {'ヤマダ'}
    kananamae             {'タロウ'}
    birthday              {'1989-04-03'}
  end
end