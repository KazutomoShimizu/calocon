require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'バリデーションテスト' do
    context '全て入力した場合' do
      it 'バリデーションに通る' do
        user = User.new(name: 'user', email: 'user@gmail.com', password: '111111', password_confirmation: '111111')
        expect(user).to be_valid
      end
    end
    context '名前が空の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: '', email: 'user@gmail.com', password: '111111', password_confirmation: '111111')
        expect(user).not_to be_valid
      end
    end
    context '名前が2文字以下の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'u', email: 'user@gmail.com', password: '111111', password_confirmation: '111111')
        expect(user).not_to be_valid
      end
    end
    context '名前が8文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'useruser1', email: 'user@gmail.com', password: '111111', password_confirmation: '111111')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'user', email: '', password: '111111', password_confirmation: '111111')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが正しくない形で入力された場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'user', email: 'a', password: '111111', password_confirmation: '111111')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'user', email: 'user@gmail.com', password: '', password_confirmation: '')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードと確認パスワードが一致しない場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'user', email: 'user@gmail.com', password: '111111', password_confirmation: '222222')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが6文字より少ない場合' do
      it 'バリデーションに引っかかる' do
        user = User.new(name: 'user', email: 'user@gmail.com', password: '111', password_confirmation: '111')
        expect(user).not_to be_valid
      end
    end
  end
end
