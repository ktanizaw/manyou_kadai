require 'rails_helper'

RSpec.describe 'ログイン/ログアウト・ユーザー登録機能', type: :system do
  before do
    @user =FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)
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
    context 'タスクのページへ飛ぼうとした場合' do
      it 'ログインページに遷移する' do
        visit tasks_path
        expect(page).to have_content 'ログイン画面'
      end
    end
end


describe '一般権限ログイン状態テスト' do
    before do
      login
    end
    context 'ユーザーがログアウトした場合' do
      it 'ログイン画面に遷移すること' do
        visit tasks_path
        click_on "Logout"
        expect(page).to have_content 'ログアウトしました'
        expect(page).to have_content 'Login'
      end
    end

    context '別ユーザーの詳細画面へ飛ぼうとした場合' do
      it 'タスク一覧画面へ遷移する' do
        visit user_path(100)
        expect(page).to have_content 'タスク一覧'
      end
    end

    context 'ユーザー登録画面に飛ぼうとした場合' do
      it 'タスク一覧画面に遷移する' do
      visit new_user_path
      expect(page).to have_content 'タスク一覧'
      end
    end
end

describe '管理者ログイン状態テスト' do
  before do
    login_admin
  end
    context '管理者でログインし、管理画面へ飛んだ場合' do
      it '管理者画面のユーザー一覧が確認できる' do
      visit admin_users_path
      expect(page).to have_content '登録済みのユーザー一覧'
    end
  end
  context '管理者でユーザー作成した場合' do
  it 'ユーザーが保存される' do
    visit new_admin_user_path
    fill_in "Name", with: "testtest"
    fill_in "Email", with: "test3@test.com"
    fill_in "Password", with: "test333"
    fill_in "Password confirmation", with: "test333"
    click_on 'Create User'
    expect(page).to have_content 'testtest'
  end
end
  context '管理者でユーザー情報を更新した場合' do
    it '更新後のユーザー情報が確認できる' do
      visit edit_admin_user_path(200)
      fill_in "Name", with: "test22"
      fill_in "Email", with: "test22@test.com"
      fill_in "Password", with: "test222"
      fill_in "Password confirmation", with: "test222"
      click_on 'Update User'
      expect(page).to have_content 'test22'
    end
  end
  context '管理者でユーザー情報を削除した場合' do
    it 'ユーザー一覧画面から削除したユーザー情報がなくなる' do
      expect{ @second_user.destroy }.to change{ User.count }.by(-1)
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
