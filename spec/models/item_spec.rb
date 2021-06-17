require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
        @item = FactoryBot.build(:item)
        @item.image = fixture_file_upload('app/assets/images/hero.jpg')
    end
    describe '商品出品' do
        context '商品出品がうまくいくとき' do
            it 'image,name,description,category_id,condition_id,ship_cost_id,prefecture_id,ship_date_id,priceが存在すれば登録できる' do
                expect(@item).to be_valid
            end
        end
        context '商品出品がうまくいかないとき' do
            it 'imageが空だと出品できない' do
                @item.image = nil
                @item.valid?
                expect(@item.errors.full_messages).to include("Image can't be blank")
            end
            it 'nameが空だと出品できない' do
                @item.name = ''
                @item.valid?
                expect(@item.errors.full_messages).to include("Name can't be blank")
            end
            it 'descriptionが空だと出品できない' do
                @item.description = ''
                @item.valid?
                expect(@item.errors.full_messages).to include("Description can't be blank")
            end

            # ActiveHashに関するテストコード
            it 'category_idが空だと出品できない' do
                @item.category_id = ''
                @item.valid?
                expect(@item.errors.full_messages).to include("Category can't be blank")
            end
            it 'category_idが１だと出品できない' do
                @item.category_id = 1
                @item.valid?
                expect(@item.errors.full_messages).to include("Category can't be blank")
            end

            it 'condition_idが空だと出品できない' do
                @item.condition_id = ''
                @item.valid?
                expect(@item.errors.full_messages).to include("Condition can't be blank")
            end
            it 'condition_idが１だと出品できない' do
                @item.condition_id = 1
                @item.valid?
                expect(@item.errors.full_messages).to include("Condition can't be blank")
            end

            it 'ship_cost_idが空だと出品できない' do
                @item.ship_cost_id = ''
                @item.valid?
                expect(@item.errors.full_messages).to include("Ship cost can't be blank")
            end
            it 'ship_cost_idが1だと出品できない' do
                @item.ship_cost_id = 1
                @item.valid?
                expect(@item.errors.full_messages).to include("Ship cost can't be blank")
            end

            it 'prefecture_idが空だと出品できない' do
                @item.prefecture_id = ''
                @item.valid?
                expect(@item.errors.full_messages).to include("Prefecture can't be blank")
            end
            it 'prefecture_idが1だと出品できない' do
                @item.prefecture_id = 1
                @item.valid?
                expect(@item.errors.full_messages).to include("Prefecture can't be blank")
            end

            it 'ship_dateが空だと出品できない' do
                @item.ship_date_id = ''
                @item.valid?
                expect(@item.errors.full_messages).to include("Ship date can't be blank")
            end
            it 'ship_dateが1だと出品できない' do
                @item.ship_date_id = 1
                @item.valid?
                expect(@item.errors.full_messages).to include("Ship date can't be blank")
            end

            it 'priceが空だと出品できない' do
                @item.price = ''
                @item.valid?
                expect(@item.errors.full_messages).to include("Price can't be blank")
            end
            it 'priceが300円より安いと出品できない' do
                @item.price = '100'
                @item.valid?
                expect(@item.errors.full_messages).to include("Price is out of setting range")
            end
            it 'priceが9,999,999円より高いと出品できない' do
                @item.price = '100000000'
                @item.valid?
                expect(@item.errors.full_messages).to include("Price is out of setting range")
            end
            it 'priceが半角英字では出品できない' do
                @item.price = 'a'
                @item.valid?
                expect(@item.errors.full_messages).to include("Price is out of setting range")
            end
            it 'priceが全角文字では出品できない' do
                @item.price = 'あああ'
                @item.valid?
                expect(@item.errors.full_messages).to include("Price is out of setting range")
            end
        end
    end
end
