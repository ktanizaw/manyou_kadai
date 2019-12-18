require 'rails_helper'

RSpec.describe 'ログイン/ログアウト・ユーザー登録機能', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
  end

  def login_admin
      visit new_session_path
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: 'test111'
      click_on 'Log in'
  end

  def login
      visit new_session_path
      fill_in 'Email', with: 'test2@test.com'
      fill_in 'Password', with: 'test222'
      click_on 'Log in'
  end

  describe 'ログアウト状態テスト' do
    context '作成済みユーザーでログインした場合' do
      it 'タスク一覧画面に遷移すること' do
        visit new_session_path
        fill_in "Email", with: "test1@test.com"
        fill_in "Password", with: "test111"
        click_on 'Log in'
        expect(page).to have_content 'タスク一覧'
      end
    end
  end
    context 'タスクのページへ飛ぼうとした場合' do
      it 'ログインページに遷移する'
        visit tasks_path
        expect(page).to have_content 'ログイン画面'


  describe 'ログイン状態テスト' do
    before do
      login
    end
    context 'ユーザーがログアウトした場合' do
      it 'ログイン画面に遷移すること' do
        visit tasks_path
        click_on "Logout"
        expect(page).to have_content 'ログアウトしました'
        expect(page).to have_content 'Log in'
      end
    end
  end


  describe 'ユーザー登録画面' do
    context 'ユーザー登録した場合' do
      it 'ログインした状態でタスク一覧画面に遷移する' do
        visit new_user_path
        fill_in "Name", with: "test"
        fill_in "Email", with: "test@test.com"
        fill_in "Password", with: "test111"
        fill_in "Password confirmation", with: "test111"
        click_on 'Create User'
        expect(page).to have_content 'タスク一覧'
        expect(page).to have_content 'Logout'
      end
    end
  end
end
