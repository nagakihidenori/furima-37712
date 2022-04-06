class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :cities, :building, :tell_num, :token

  with_options presence: true do

    validates :user_id
    validates :item_id

    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :cities
    validates :tell_num, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }

    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    SendRecord.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, cities: cities, building: building, tell_num: tell_num)
  end

end