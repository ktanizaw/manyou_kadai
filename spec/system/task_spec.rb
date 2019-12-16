require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
	    visit tasks_path
	    # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
      # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）
      expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
	   end
   end
    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の降順に並んでいること' do
      visit tasks_path
      # task_list = all('.task_row') # タスク一覧を配列として取得するため、View側でidを振っておく
      expect(Task.order(created_at: :desc).map(&:id)).to eq [2, 1]
      # expect(task_list[0]).to have_content 'Factoryで作ったデフォルトのタイトル１'
      # expect(task_list[1]).to have_content 'Factoryで作ったデフォルトのタイトル２'
      end
    end
  end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
      # task = FactoryBot.create(:task, title: 'Example Task')
      # new_task_pathにvisitする（タスク登録ページに遷移する）
      # 1.ここにnew_task_pathにvisitする処理を書く

      # 「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄に
      # タスクのタイトルと内容をそれぞれfill_in（入力）する
      # 2.ここに「タスク名」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
      visit new_task_path
      fill_in "タイトル", with: "Factoryで作ったデフォルトのタイトル１"
      # 3.ここに「タスク詳細」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
      fill_in "内容", with: "Factoryで作ったデフォルトのタイトル２"
      # 「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）
      # 4.「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
      click_on '登録する'
      # clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
      # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
      # 5.タスク詳細ページに、テストコードで作成したはずのデータ（記述）がhave_contentされているか（含まれているか）を確認（期待）するコードを書く
      expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
      expect(page).to have_content 'Factoryで作ったデフォルトのタイトル２'
      end
    end
  end

  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示されたページに遷移すること' do
         @task1 = Task.create(title: 'Example Task')
         @task2 = Task.create(title: 'Example Taskcontent')
        visit  task_path(@task1.id)
        expect(page).to have_content @task1.title
        expect(page).not_to have_content @task2.title
        end
       end
     end
  end
