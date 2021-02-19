class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, messege: "Include both letters and numbers" }

  validates :nickname, presence: true
  validates :last_name_kanji, presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'Full-width characters' }
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'Full-width characters' }
  validates :last_name_kana , presence: true, format:{with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message: "Full-width katakana characters"}
  validates :first_name_kana, presence: true, format:{with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message: "Full-width katakana characters"}
  validates :birthday, presence: true

end
