class Commo < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :commo_st, :commo_deli_day, :commo_deli_charge, :commo_cate, :prefecture

  validates :commo_name, presence: true
  validates :commo_ex, presence: true
  validates :commo_cate_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :commo_st_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :commo_deli_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :commo_deli_day_id, numericality: { other_than: 1 , message: "can't be blank"} 

  has_one_attached :image

end
