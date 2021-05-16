require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end                                                                  
  describe '商品出品機能' do                                      
   context '出品できるとき' do
    it '項目が全て適切なら登録できる' do
      expect(@item).to be_valid
    end
   end
                                                                          
   context '出品できないとき' do
    it '画像がない場合' do
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
    end 

    it 'タイトルがない場合' do
     @item.title = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Title can't be blank")
    end    

    it '説明がない場合' do   
     @item.catch_copy = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Catch copy can't be blank")
    end       
                                                                                                
    it 'カテゴリーを指定していない' do
     @item.category_id = 0
     @item.valid?
     expect(@item.errors.full_messages).to include("Category must be other than 0")
    end        

    it '状態を指定していない' do
     @item.condition_id = 0
     @item.valid?
     expect(@item.errors.full_messages).to include("Condition must be other than 0")
    end         

    it '配送料の負担を指定していない' do
      @item.fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee must be other than 0")
    end         

    it '地域を指定していない' do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 0")   
    end         

    it '発送までの日数を指定していない' do
      @item.days_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Days must be other than 0")
    end       

    it '販売価格未設定' do 
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end      

    it '販売価格が299以下' do 
      @item.price = 299                                     
      @item.valid?                                            
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end                   
                                                                 
    it '販売価格が10000000以上' do 
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end 
    it '販売価格が半角英数でない場合' do
      @item.price = '１００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end  

  end                                      
end                                 
end
                               
                                
                           
                   
                       
                        
                           
                           
  







   