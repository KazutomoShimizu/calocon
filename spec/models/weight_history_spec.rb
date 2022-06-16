require 'rails_helper'
  describe 'weight_historyモデル機能', type: :model do
    let!(:user){ FactoryBot.create(:user) }
    describe 'バリデーションテスト' do
      context 'weightが空の場合' do
        it 'バリデーションにひっかる' do
          weight_history = WeightHistory.new(weight: nil, start_time: "#{Time.now}", user: user)
          expect(weight_history).not_to be_valid
        end
      end
      context 'start_timeが未来の場合' do
        it 'バリデーションにひっかる' do
          weight_history = WeightHistory.new(weight: 50, start_time: "#{Time.now + 24 * 60 * 60}", user: user)
          expect(weight_history).not_to be_valid
        end
      end
      context 'weightとstart_timeが通常値の場合' do
        it 'バリデーションが通る' do
          weight_history = WeightHistory.new(weight: 50, start_time: "#{Time.now}", user: user)
          expect(weight_history).to be_valid
        end
      end
    end
  end
