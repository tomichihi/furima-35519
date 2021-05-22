require 'rails_helper'

RSpec.describe RecordPlace, type: :model do
  before do
    buyer  = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    @record_place = FactoryBot.build(:record_place, user_id: buyer.id, item_id: item.id)
    sleep(1)
  end
  
  describe '商品情報の保存' do
      context '内容に問題ない場合' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@record_place).to be_valid
        end

        it 'buildingは空でも保存できること' do
          @record_place.building = ''
          expect(@record_place).to be_valid
        end
      
      end
  
      context '内容に問題がある場合' do
        it 'pos_codeが空だと保存できないこと' do
          @record_place.pos_code = ''
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Pos code can't be blank", "Pos code is invalid. Include hyphen(-)")
        end

        it 'pos_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @record_place.pos_code = '1112222'
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Pos code is invalid. Include hyphen(-)")
        end

        it 'area_idを選択していないと保存できないこと' do
          @record_place.area_id = '0'
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Area can't be blank")
        end

        it 'priceが空だと保存できないこと' do
          @record_place.price = ''
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Price can't be blank", "Price is not a number")
        end

        it 'priceが全角数字だと保存できないこと' do
          @record_place.price = '３００'
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが300円未満では保存できないこと' do
          @record_place.price = '299'
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it 'priceが10000000円以上では保存できないこと' do
          @record_place.price = '10000000'
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Price must be less than or equal to 9999999")       
        end

        it 'cityがないと保存できない' do
          @record_place.city = ''
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("City can't be blank")
        end

        it 'addressがないと保存できない' do
          @record_place.address = ''
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Address can't be blank")
        end

        it 'phone_numがないと保存できない' do
          @record_place.phone_num = ''
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Phone num can't be blank", "Phone num is invalid")
        end

        it 'phone_numが12桁以上は保存できない' do
          @record_place.phone_num = '111222333344'
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")
        end
        
        it 'userが紐付いていないと保存できないこと' do
          @record_place.user_id = nil
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("User can't be blank")
        end 

        it 'itemが紐付いていないと保存できないこと' do
          @record_place.item_id = nil
          @record_place.valid?
          expect(@record_place.errors.full_messages).to include("Item can't be blank")
        end

        

      end
    end
  end