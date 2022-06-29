class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  

  validates :nickname, presence: true
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  with_options presence: true do
    validates :last_name, format: { with: NAME_REGEX, message: 'に全角文字を使用してください' }
    validates :first_name, format: { with: NAME_REGEX, message: 'に全角文字を使用してください' }
  end
  NAME_KANA_REGEX = /\A[ァ-ンー]+\z/
  with_options presence: true do
    validates :last_name_kana, format: { with: NAME_KANA_REGEX, message: 'に全角カナ文字を使用してください' } 
    validates :first_name_kana, format: { with: NAME_KANA_REGEX, message: 'に全角カナ文字を使用してください' } 
  end
  validates :date_of_birth, presence: true
  validates :encrypted_password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]\z/i, message: 'は6文字以上の英数字が使えます' }

end