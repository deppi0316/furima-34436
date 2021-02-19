class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, messege: "Include both letters and numbers" }

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'Full-width characters' } do
      validates :last_name_kanji
      validates :first_name_kanji
    end
    with_options format:{with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message: "Full-width katakana characters"} do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  belongs_to :user

end
