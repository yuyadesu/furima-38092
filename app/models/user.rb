class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname, presence: true
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  with_options presence: true do
    validates :last_name, format: { with: NAME_REGEX }
    validates :first_name, format: { with: NAME_REGEX }
  end
  NAME_KANA_REGEX = /\A[ァ-ンー]+\z/
  with_options presence: true do
    validates :last_name_kana, format: { with: NAME_KANA_REGEX } 
    validates :first_name_kana, format: { with: NAME_KANA_REGEX } 
  end
  validates :date_of_birth, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: PASSWORD_REGEX }
end