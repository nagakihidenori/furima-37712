FactoryBot.define do
  factory :order_form do
    user_id { 1 }
    item_id { 1 }
    post_code { "123-4567" }
    prefecture_id { 2 }
    municipality { "仙台市青森区" }
    cities { "岩手町１" }
    building { "秋田" }
    tell_num { Faker::Number.decimal_part(digits: 11 )}
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
