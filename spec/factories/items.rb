FactoryBot.define do
  factory :item do

    association :user
    

    commo_name { 'tanaka' }
    commo_ex { '東北楽天のピッチャーです' }
    commo_cate_id { Faker::Number.between(from: 2, to: 10) }
    commo_st_id { Faker::Number.between(from: 2, to: 6) }
    commo_deli_charge_id { Faker::Number.between(from: 2, to: 2) }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    commo_deli_day_id { Faker::Number.between(from: 2, to: 3) }
    commo_price { Faker::Number.between(from: 300, to: 9999999) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.jpeg'), filename: 'image.jpeg')
    end
  end
end