require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる場合' do
      it 'image,name,text,category,status,delivery_method,delivery_area,delivery_day,priceが存在していれば保存ができる' do
        expect(@item).to be_valid
      end
    end


    context '商品出品ができない場合' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'text空だと保存できない' do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'category_idが1の場合保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it 'status_idが1の場合保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end

      it 'delivery_method_idが1の場合保存できない' do
        @item.delivery_method_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery method Select")
      end

      it 'delivery_area_idが1の場合保存できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area Select")
      end

      it 'delivery_day_idが1の場合保存できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day Select")
      end

      it 'priceが空だと保存できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角の場合保存できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it 'priceが数値以外の場合保存できない' do
        @item.price = "テスト"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

      it 'priceが299以下の場合保存できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it 'priceが10000000以上の場合保存できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
