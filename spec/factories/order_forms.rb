FactoryBot.define do
  factory :order_form do

    post_code  {Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id  {Faker::Number.between(from: 2, to: 47) }
    municipality  {Faker::Address.city }
    cities { Faker::Address.street_address }
    building { Faker::Address.street_address }
    tell_num { Faker::Number.decimal_part(digits: 11 )}
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
