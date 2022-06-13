require 'rails_helper'

RSpec.describe 'カロリー管理', type: :system do
  let!(:user){ FactoryBot.create(:user) }
  let!(:momentum_count){ FactoryBot.create(:momentum_count) }

  describe 'カロリー計算機能' do
    before do
      visit new_user_session_path
      fill_in "user[email]",with: "admin@admin.com"
      fill_in "user[password]",with: "111111"
      click_on "Log in"
    end
    context '基礎代謝と運動量を入れる事ができる' do
      it '目標摂取カロリーが表示される' do
        visit momentum_counts_path
        fill_in 'inputcity', with: "2000"
        select 'ほぼ運動しない', from: 'magnification'
        click_on '計算'
        expect(page).to have_content '2400'
      end
    end
    context '基礎代謝と運動量を入れる事ができる' do
      it 'ダイエット目標摂取カロリーが表示される' do
        visit momentum_counts_path
        fill_in 'inputcity', with: "2000"
        select 'ほぼ運動しない', from: 'magnification'
        click_on '計算'
        expect(page).to have_content '1900'
      end
    end
  end
end
