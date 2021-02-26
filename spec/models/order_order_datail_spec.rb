require 'rails_helper'

RSpec.describe OrderOrderDatail, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_order_datail = FactoryBot.build(:order_order_datail, user_id: user.id,item_id: item.id)
      sleep 0.1
    end

    context '商品購入ができる場合' do

      it '全ての値が正しく入力されていた場合' do
        expect(@order_order_datail).to be_valid
      end

      it 'bulding_nameが入ってない場合購入できる' do
        @order_order_datail.building_name = ""
        expect(@order_order_datail).to be_valid
      end
    end

    context '商品購入ができない場合' do

      it 'postal_codeが空の場合購入できない' do
        @order_order_datail.postal_code = ""
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが入ってない場合登録できない' do
        @order_order_datail.postal_code = '1234567'
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Postal code is invalid.  Input correctly")
      end

      it 'postal_codeにハイフンの前が3文字じゃない場合登録できない' do
        @order_order_datail.postal_code = '12-4567'
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Postal code is invalid.  Input correctly")
      end

      it 'postal_codeにハイフンの後が4文字じゃない場合登録できない' do
        @order_order_datail.postal_code = '123-456'
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Postal code is invalid.  Input correctly")
      end

      it 'delivery_area_idが1の場合購入できない' do
        @order_order_datail.delivery_area_id = 1
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Delivery area Select")

      end

      it 'municipalityが空の場合購入できない' do
        @order_order_datail.municipality = ""
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空の場合購入できない' do
        @order_order_datail.address = ""
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空の場合購入できない' do
        @order_order_datail.phone_number = ""
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが数値以外の場合購入できない' do
        @order_order_datail.phone_number = "テスト"
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Phone number Input only number")
      end

      it 'phone_numberが全角の場合購入できない' do
        @order_order_datail.phone_number = "０９０１２３４５６７８"
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Phone number Input only number")
      end

      it 'phone_numberが12桁以上の場合の場合購入できない' do
        @order_order_datail.phone_number = 999999999999
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Phone number Input only number")
      end

      it 'tokenが空の場合購入できない' do
        @order_order_datail.token = nil
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Token can't be blank")
        
      end

      it 'userが紐づいていない場合登録できない' do
        @order_order_datail.user_id = nil
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていない場合登録できない' do
        @order_order_datail.item_id = nil
        @order_order_datail.valid?
        expect(@order_order_datail.errors.full_messages).to include("Item can't be blank")
        
      end
    end
  end
end