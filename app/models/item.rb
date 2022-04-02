class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :commo_st, :commo_deli_day, :commo_deli_charge, :commo_cate, :prefecture

  validates :commo_name, presence: true
  validates :commo_ex, presence: true
  validates :commo_cate_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :commo_st_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :commo_deli_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :commo_deli_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
  with_options presence: true, format: { with:/\A[0-9]+\z/ } do
    validates :commo_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
                            presence: { message: "can't be blank"}
  end
  has_one_attached :image

end
