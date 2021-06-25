require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'token, postal_code, prefecture_id, city, house_number, building_name, phone_number,user_id,item_idがあれば保存できる' do
        expect(@record_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end

    context '購入情報の保存がうまくいかないとき' do
      it 'tokenが空だと保存できない' do
        @record_address.token = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できない' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフンなしでは保存できない' do
        @record_address.postal_code = '12345678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが全角文字列だと保存できない' do
        @record_address.postal_code = 'あああ'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空だと保存できない' do
        @record_address.prefecture_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと出品できない' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @record_address.house_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは英数混合だと保存できない' do
        @record_address.phone_number = 'aaaaaaaaa11'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @record_address.phone_number = '12345678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @record_address.phone_number = '123456789999'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberにハイフンがあると保存できない' do
        @record_address.phone_number = '090-1234-5678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空だと保存できない' do
        @record_address.user_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @record_address.item_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end