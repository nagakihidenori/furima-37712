class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :nickname, presence: true
        validates_format_of :email, presence: true, uniqueness: true, with: /(?=@*?)/
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, length: { minimum: 6 }, with: PASSWORD_REGEX
        validates :myouji, presence: true
        validates :namae, presence: true
        validates :kanamyouji, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
        validates :kananamae, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
        validates :birthday, presence: true
end
