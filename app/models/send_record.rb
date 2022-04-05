class SendRecord < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :post_code, presence: true
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :cities, presence: true
  validates :building
  validates :tell_num, presence: true
  
  belongs_to :order

end
