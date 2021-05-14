require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
 describe 'ユーザー新規登録' do
  context '新規登録できるとき' do
    it '項目が全て適切なら登録できる' do
      expect(@user).to be_valid
    end
    
    it 'passwordとpassword_confirmationが6文字以上の半角英数であれば登録できる' do
      @user.password = 'a00000'
      @user.password_confirmation = 'a00000'
      expect(@user).to be_valid
    end
  end

  context '新規登録できないとき' do
    
    it 'nicknameが空では登録できない' do
     @user.name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空では登録できない' do
     @user.email =''
     @user.valid?
     expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
     @user.password =''
     @user.valid?
     expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
     @user.password_confirmation = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'nameが9文字以上では登録できない' do
     @user.name = 'tomichihi'
     @user.valid?
     expect(@user.errors.full_messages).to include('Name is too long (maximum is 8 characters)')
    end

    it '重複したemailが存在する場合登録できない' do
     @user.save
     another_user = FactoryBot.build(:user)
     another_user.email = @user.email
     another_user.valid?
     expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it '@がないemailは登録できない' do
    @user.email = 'tomita.gmail.com'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下では登録できない' do
     @user.password = '00000'
     @user.password_confirmation = '00000'
     @user.valid?
     expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordに英字が含まれていなければ登録できない'do
     @user.password = '000000'
     @user.password_confirmation = '00000'
     @user.valid?
     expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordに数字が含まれていなければ登録できない'do
     @user.password = 'tomita'
     @user.password_confirmation = 'tomita'
     @user.valid?
     expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが全角だと登録できない'do
     @user.password = 'とみたちひろ'
     @user.password_confirmation = 'とみたちひろ'
     @user.valid?
     expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it '名字が無ければ登録できない'do
     @user.last_name = '' 
     @user.valid?
     expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '名前が無ければ登録できない'do
     @user.first_name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("First name can't be blank")
     end

     it '名字（カナ）が無ければ登録できない'do
     @user.last_name_kana = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end

     it '名前（カナ）が無ければ登録できない'do
     @user.first_name_kana = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
    
    it '生年月日が含まれていなければ登録できない' do
    @user.birth = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

    it '名字は漢字、ひらがな、カタカナでなければ登録できない' do
    @user.last_name = 'tomita'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name is invalid')                
    end
                     
    it '名前は漢字、ひらがな、カタカナでなければ登録できない' do
    @user.first_name = 'chihiro'  
    @user.valid?
    expect(@user.errors.full_messages).to include('First name is invalid')                          
    end
                     
    it '名字（カナ）はカタカナでなければ登録できない' do
    @user.last_name_kana = '富田' 
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana is invalid')                          
               
    end 

    it '名前（カナ）はカタカナでなければ登録できない' do
    @user.first_name_kana = '千滉' 
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana is invalid')                          
                
    end 

  end
end
end

 
