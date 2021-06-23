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
        it 'postal_code, prefecture_id, city, house_number, building_name, phone_numberがあれば購入できる' do
            expect(@record_address).to be_valid
        end
        it 'building_nameが空でも登録できる' do
            @record_address.building_name = ''
            expect(@record_address).to be_valid
        end
    end
    

    context '購入情報の保存がうまくいかないとき' do
        it 'postal_codeが空だとできない' do
            @record_address.postal_code = ''
            @record_address.valid?
            expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeがハイフンなしでは保存できない' do
            @record_address.postal_code = '12345678'
            @record_address.valid?
            expect(@record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it 'postal_codeが全角文字列だと保存できない' do
            @record_address.postal_code = 'あああ'
            @record_address.valid?
            expect(@record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
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
        it 'phone_numberが9桁以下だと保存できない' do

        end
        it 'phone_numberが12桁以上だと保存できない' do
        end
        it 'phone_numberにハイフンがあると保存できない' do
            @record_address.phone_number = '090-1234-5678'
            @record_address.valid?
            expect(@record_address.errors.full_messages).to include("Phone number is invalid")
        end
    end
  end

end

# 配送先の住所情報も購入の都度入力させること。
# 郵便番号が必須であること。
# 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。
# 都道府県が必須であること。
# 市区町村が必須であること。
# 番地が必須であること。
# 建物名は任意であること。
# 電話番号が必須であること。
# 電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。
