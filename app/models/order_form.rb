class OrderForm
  include ActiveModel::Model
  after_accessor :user_id, :item_id, :post_code, :prefecture, :municipality, :cities, :building, :tell_num
  def save
  end

end