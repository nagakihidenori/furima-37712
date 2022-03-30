class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :nickname, presence: true
        validates_format_of :email, presence: true, uniqueness: true, with: /(?=@*?)/
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX
        validates :myouji, presence: true
        validates :namae, presence: true
        validates :kanamyouji, presence: true
        validates :kananamae, presence: true
        validates :birthday, presence: true
end
