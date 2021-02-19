require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    context '新規登録ができる場合' do
      it 'nicknameとemail,password,password_coonfirmation,ユーザー名（氏名、漢字、カナ全て）,birthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だと登録できないこと' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できないこと' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailが@を含んでいない場合登録できないこと' do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空だと登録できないこと' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下の場合登録できないこと' do
        @user.password = "a1111"
        @user.password_confirmation = "a1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが6文字以上かつ数字のみの場合登録できないこと' do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが6文字以上かつ英字のみの場合登録できないこと' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
        
      end

      it 'password_confirmationが空の場合登録できないこと' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致の場合登録できないこと' do
        @user.password_confirmation = "a11111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名（漢字）が名字のみだと登録できないこと' do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end

      it 'ユーザー本名（漢字）が名前のみだと登録できないこと' do
        @user.last_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end

      it'ユーザー本名（漢字）の名字が半角の場合登録できないこと'do
        @user.last_name_kanji = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji Full-width characters")
      end

      it'ユーザー本名（漢字）の名前が半角の場合登録できないこと'do
        @user.first_name_kanji = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji Full-width characters")
      end

      it 'ユーザー本名のフリガナが名字のみだと登録できないこと' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      
      it 'ユーザー本名のフリガナが名前のみだと登録できないこと' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'ユーザー本名のフリガナの名字が漢字のみだと登録できないこと'do
        @user.last_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end

      it 'ユーザー本名のフリガナの名前が漢字のみだと登録できないこと'do
        @user.first_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end

      it'ユーザー本名のフリガナの名字がひらがなのみだと登録できないこと'do
        @user.last_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end

      it'ユーザー本名のフリガナの名前がひらがなのみだと登録できないこと'do
        @user.first_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end

      it'ユーザー本名のフリガナの名字が半角の場合登録できないこと'do
        @user.last_name_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end

      it'ユーザー本名のフリガナの名前が半角の場合登録できないこと'do
        @user.first_name_kana = "ﾀﾛｳﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      
      it '生年月日が空の場合登録できないこと' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
