require 'rails_helper'

RSpec.describe "ユーザー登録",type: :system do
  describe "ユーザー登録機能" do
    context "新規登録した場合" do
      it "トップページが表示される" do
        visit new_user_registration_path
        fill_in "user[name]",with: "admin"
        fill_in "user[email]",with: "admin@admin.com"
        fill_in "user[password]",with: "1111111"
        fill_in "user[password_confirmation]",with: "1111111"
        click_on "Sign up"
        expect(page).to have_content "caLocon"
      end
      it "ログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移する" do
        visit foods_path
        expect(current_path).to eq user_session_path
      end
    end
  end

  describe "ログイン機能" do
    let!(:user){ FactoryBot.create(:user) }
    let!(:second_user){ FactoryBot.create(:second_user) }
    before do
      visit new_user_session_path
      fill_in "user[email]",with: "admin@admin.com"
      fill_in "user[password]",with: "111111"
      click_on "Log in"
    end
    context "ログインした場合" do
      it "Topページに移動" do
        expect(page).to have_content "caLocon"
      end
      it "他人のマイページに飛ぶとFoodsに遷移する" do
        visit user_path(second_user.id)
        expect(current_path).to eq foods_path
      end
    end
    context "ログアウトした場合" do
      it "Topページに遷移する" do
        click_link "Logout"
        expect(current_path).to eq root_path
      end
    end
  end

  describe "管理画面" do
    let!(:user){ FactoryBot.create(:user) }
    let!(:second_user){ FactoryBot.create(:second_user) }
    let!(:food){ FactoryBot.create(:food,user: user) }
      before do
        visit new_user_session_path
        fill_in "user[email]",with: "admin@admin.com"
        fill_in "user[password]",with: "111111"
        click_on "Log in"
        visit rails_admin_path
      end
      it "管理画面に遷移できる" do
        expect(current_path).to eq rails_admin_path
        expect(page).to have_content "サイト管理"
      end

      it "ユーザーの新規登録ができる" do
        page.all(".nav-link")[8].click
        click_on "新規作成"
        fill_in "user[email]",with: "sample@sample.com"
        fill_in "user[password]",with: "111111"
        fill_in "user[password_confirmation]",with: "111111"
        fill_in "user[name]",with: "sample"
        click_on "保存"
        expect(page).to have_content "ユーザーの一覧"
      end
  end
end
