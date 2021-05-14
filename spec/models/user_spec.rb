require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
 context '新規登録できるとき' do
  describe 'ユーザー新規登録' do
    it '項目が全て適切なら登録できる' do
      expect(@user).to be_valid
    end
    
    it 'passwordとpassword_confirmationが6文字以上の半角英数であれば登録できる' do
      @user.password = 'a00000'
      @user.password_confirmation = 'a00000'
      expect(@user).to be_valid
    end
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
  it 'nicknameが9文字以上では登録できない' do
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
  it 'passwordが5文字以下では登録できない' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
 end
end