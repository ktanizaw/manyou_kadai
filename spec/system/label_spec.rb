require 'rails_helper'

RSpec.describe 'ラベル管理機能', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:label)
    FactoryBot.create(:second_label)
    FactoryBot.create(:labelling)
    FactoryBot.create(:second_labelling)
  def login_admin
        visit new_session_path
        fill_in 'Email', with: 'test1@test.com'
        fill_in 'Password', with: 'test111'
        click_on 'Log in'
  end
  end

    describe 'ラベル登録画面' do
      context '必要項目を入力して、createボタンを押した場合' do
        it 'データ保存後、タスク一覧画面に表示される' do
          visit new_label_path
          fill_in 'Name', with: 'test1'
          click_on('Create Label')
          expect(page).to have_content 'test1'
        end

        it '空白のラベルは保存されない' do
          visit new_label_path
          click_on('Create Label')
          expect(page).to have_content "入力してください！"
        end
      end
    end

    describe 'タスク一覧・詳細画面' do
      context 'ラベル付タスクを作成した場合' do
        it 'タスク一覧にラベルが表示されること' do
          visit new_task_path
          fill_in "Title", with: "タイトル１"
          fill_in "Content", with: "コンテント１"
          check "label_ids[1]"
          click_on 'Create Task'
          visit tasks_path
          expect(page).to have_content "test1"
        end
    end
  end

    describe 'ラベル検索機能' do
      context 'ラベルで絞り込み検索した場合' do
        it '絞り込んだラベルが表示される' do
          visit tasks_path
          select 'test1', from: 'label_ids[]'
          click_on('絞り込み')
          task_list = page.all('tr')
          expect(task_list[1]).to have_content 'test1'
          expect(task_list[2]).not_to have_content 'test2'
        end
      end
    end
  end
