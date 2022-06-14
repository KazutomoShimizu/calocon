require 'rails_helper'

RSpec.describe 'カロリー管理', type: :system do
  let!(:user){ FactoryBot.create(:user) }
  let!(:momentum_count){ FactoryBot.create(:momentum_count) }
  let!(:second_momentum_count){ FactoryBot.create(:second_momentum_count) }
  let!(:third_momentum_count){ FactoryBot.create(:third_momentum_count) }
  let!(:fourth_momentum_count){ FactoryBot.create(:fourth_momentum_count) }
  let!(:fifth_momentum_count){ FactoryBot.create(:fifth_momentum_count) }

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
    context '基礎代謝と運動量を入れる事ができる' do
      it '目標摂取カロリーが表示される' do
        visit momentum_counts_path
        fill_in 'inputcity', with: "2000"
        select '軽い運動', from: 'magnification'
        click_on '計算'
        expect(page).to have_content '2750'
      end
    end
    context '基礎代謝と運動量を入れる事ができる' do
      it 'ダイエット目標摂取カロリーが表示される' do
        visit momentum_counts_path
        fill_in 'inputcity', with: "2000"
        select '軽い運動', from: 'magnification'
        click_on '計算'
        expect(page).to have_content '2250'
      end
    end
    context '基礎代謝と運動量を入れる事ができる' do
      it '目標摂取カロリーが表示される' do
        visit momentum_counts_path
        fill_in 'inputcity', with: "2000"
        select '中程度の運動', from: 'magnification'
        click_on '計算'
        expect(page).to have_content '3100'
      end
    end
    context '基礎代謝と運動量を入れる事ができる' do
      it 'ダイエット目標摂取カロリーが表示される' do
        visit momentum_counts_path
        fill_in 'inputcity', with: "2000"
        select '中程度の運動', from: 'magnification'
        click_on '計算'
        expect(page).to have_content '2600'
      end
    end
    context '基礎代謝と運動量を入れる事ができる' do
      it '目標摂取カロリーが表示される' do
        visit momentum_counts_path
        fill_in 'inputcity', with: "2000"
        select '激しい運動', from: 'magnification'
        click_on '計算'
        expect(page).to have_content '3450'
      end
    end
    context '基礎代謝と運動量を入れる事ができる' do
      it 'ダイエット目標摂取カロリーが表示される' do
        visit momentum_counts_path
        fill_in 'inputcity', with: "2000"
        select '激しい運動', from: 'magnification'
        click_on '計算'
        expect(page).to have_content '2950'
      end
    end
    context '基礎代謝と運動量を入れる事ができる' do
      it '目標摂取カロリーが表示される' do
        visit momentum_counts_path
        fill_in 'inputcity', with: "2000"
        select '非常に激しい運動', from: 'magnification'
        click_on '計算'
        expect(page).to have_content '3800'
      end
    end
    context '基礎代謝と運動量を入れる事ができる' do
      it 'ダイエット目標摂取カロリーが表示される' do
        visit momentum_counts_path
        fill_in 'inputcity', with: "2000"
        select '非常に激しい運動', from: 'magnification'
        click_on '計算'
        expect(page).to have_content '3300'
      end
    end
  end
end
