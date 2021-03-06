class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :orders
    has_many :items
        validates :nickname, presence: true
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX
        validates :myouji, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
        validates :namae, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
        validates :kanamyouji, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
        validates :kananamae, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
        validates :birthday, presence: true
end
