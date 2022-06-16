require 'rails_helper'
  describe 'Foodモデル機能', type: :model do
    let!(:user){ FactoryBot.create(:user) }
    context 'Foodのimageが空の場合' do
      it 'バリデーションにひっかる' do
        food = Food.new(image: nil, body: 'test', user: user)
        expect(food).to not_be_valid
      end
    end
    context 'bodyが100文字以上の場合' do
      it 'バリデーションにひっかる' do
        food = Food.new(image: nil, body: '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', user: user)
        expect(food).not_to be_valid
      end
    end
    #context 'foodのimageが選択されている場合' do
      #it 'バリデーションが通る' do
        #food = FactoryBot.build(:food)
          #food.image = fixture_file_upload("test.png")
        #expect(food).to be_valid
      #end
    #end
  end
