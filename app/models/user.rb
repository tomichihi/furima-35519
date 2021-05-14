class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :name,                 presence: true, length: { maximum: 8 }
         validates :password,             presence: true
         validates :password_confirmation,presence: true
         validates :encrypted_password, :password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}  
         validates :last_name,            presence: true
         validates :first_name,           presence: true
         validates :last_name_kana,       presence: true
         validates :first_name_kana,      presence: true
         validates :birth,                presence: true   
end
