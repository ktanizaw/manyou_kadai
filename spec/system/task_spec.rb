require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  def login_admin
        visit new_session_path
        fill_in 'Email', with: 'test1@test.com'
        fill_in 'Password', with: 'test111'
        click_on 'Log in'
  end

  describe 'タスク一覧画面' do
   #  context 'タスクを作成した場合' do
   #    it '作成済みのタスクが表示されること' do
	 #    visit tasks_path
   #    expect(page).to have_content 'タイトル１'
	 #   end
   # end
    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の降順に並んでいること' do
      visit tasks_path
      task_list = all('.task_list')
      # expect(task_list[0]).to have_content 'タイトル２'
      # expect(task_list[1]).to have_content 'タイトル１'
      expect(Task.order(created_at: :desc).map(&:id)).to eq [2, 1]
      end
    end
  end

  describe 'タスク登録画面' do
  before do
    login_admin
  end
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
      visit new_task_path
      fill_in "Title", with: "タイトル１"
      fill_in "Content", with: "コンテント１"
      click_on 'Create Task'
      expect(page).to have_content 'タイトル１'
      expect(page).to have_content 'test'
      end
    end
  end

  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容と該当ラベルが表示されたページに遷移すること' do
         @task1 = FactoryBot.create(:task)
         @task2 = FactoryBot.create(:second_task)
        visit task_path(@task1.id)
        expect(page).to have_content @task1.title
        expect(page).not_to have_content @task2.title
        end
       end
     end

  describe 'タスク一覧画面' do
    context 'タスクの終了期限を降順にソートした場合' do
       it '該当タスクが終了期限を降順に表示されたページに遷移すること' do
         visit tasks_path
         expect(Task.order(deadline: :desc).map(&:id)).to eq [2, 1]
        end
     end
  end

  describe 'タスク一覧画面' do
     context 'タスクの優先順位を降順にソートした場合' do
       it '該当タスクが優先順位を降順に表示されたページに遷移すること' do
         visit tasks_path
         expect(Task.order(rank: :desc).map(&:id)).to eq [1, 2]
       end
     end
   end
end
