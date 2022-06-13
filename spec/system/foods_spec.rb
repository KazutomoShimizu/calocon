require 'rails_helper'

RSpec.describe 'Food管理', type: :system do
  let!(:user){ FactoryBot.create(:user) }
  let!(:food){ FactoryBot.create(:food,user: user) }
  let!(:second_food){ FactoryBot.create(:second_food,user: user) }

  describe '新規作成機能' do
    before do
      visit new_user_session_path
      fill_in "user[email]",with: "admin@admin.com"
      fill_in "user[password]",with: "111111"
      click_on "Log in"
    end
    context 'タスクを新規作成した場合ステータスも登録できる' do
      it '作成したタスクが表示される' do
        visit new_food_path
        attach_file 'food_image', "#{Rails.root}/spec/fixtures/test.png"
        fill_in 'food_body', with:'sample_food'
        click_on '投稿'
        expect(page).to have_content 'sample_food'
      end
    end
  end

  describe '一覧表示機能' do
    before do
      visit new_user_session_path
      fill_in "user[email]",with: "admin@admin.com"
      fill_in "user[password]",with: "111111"
      click_on "Log in"
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのFood一覧が表示される' do
        visit foods_path
        expect(page).to have_selector("img[src$='test.png']")
      end
    end
  end

  describe '詳細表示機能' do
    before do
      visit new_user_session_path
      fill_in "user[email]",with: "admin@admin.com"
      fill_in "user[password]",with: "111111"
      click_on "Log in"
    end
    context '任意のFood詳細画面に遷移した場合' do
      it '該当Foodの内容が表示される' do
        visit food_path(food.id)
        expect(page).to have_content 'テスト'
      end
    end
  end
end
