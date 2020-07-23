class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  validates :email,
   format: { with: /\A[a-zA-Z0-9_#!$%&`'*+-{|}~^\/=?.]+@[a-zA-Z0-9][a-zA-Z0-9.-]+\z/},
   presence: true
  validates :password, format: {with: /[a-z\d]{7,}/i} #アルファベット、７文字以上
  validates :first_name, :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/} #全角ひらがなカタカナ漢字
  validates :kana_family_name, :kana_first_name, format: {with: /\A[ぁ-んー－]+\z/} #全角ひらがわ
end
