class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :records
  has_many :items
  namae = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  kana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :name, length: { maximum: 8 }
    validates :password
    validates :password_confirmation
    validates :last_name, format: { with: namae }
    validates :first_name, format: { with: namae }
    validates :last_name_kana, format: { with: kana }
    validates :first_name_kana, format: { with: kana }
    validates :birth
  end
  validates :password, :password_confirmation, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
end
