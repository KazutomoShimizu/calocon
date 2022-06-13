require 'rails_helper'
  describe 'Foodモデル機能', type: :model do
    context 'Foodのimageが空の場合' do
      it 'バリデーションにひっかる' do
        food = Food.new(image: nil, body: 'test')
        expect(food).not_to be_valid
      end
    end
    context 'foodのimageが選択されている場合' do
      it 'バリデーションが通る' do
        post = FactoryBot.build(:food)
        food.image = fixture_file_upload("test.png")
        expect(food).to be_valid
      end
    end
  end
