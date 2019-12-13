require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do

  it 'titleが空ならバリデーションが通らない' do
    task = Task.new(title: '')
    task.valid?
    expect(task.errors[:title]).to include("入力してください！")
  end

  it 'titleとrankとstatusに内容が記載されていればバリデーションが通る' do
    task = Task.new(title: 'テスト', rank: 1, status: 1)
    expect(task).to be_valid
  end

  it 'titleの文字数が11文字以上だとバリデーションが通らない' do
    task = Task.new(title: "aaaaaaaaaaa")
    expect(task).not_to be_valid
  end

  it 'contentの文字数が31文字以上だとバリデーションが通らない' do
    task = Task.new(content: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    expect(task).not_to be_valid
  end

  before do
    @task1 = FactoryBot.create(:task)
    @task2 = FactoryBot.create(:second_task)
  end

  it 'get_by_titleメソッド使用時、titleが一致した場合' do
    expect(Task.get_by_title("タイトル１")).to include(@task1)
  end

  it 'get_by_titleメソッド使用時、titleのデータが存在しない場合' do
    expect(Task.get_by_title("タイトルなし")).not_to include(@task1)
  end

  it 'get_by_statusメソッド使用時、statusに未着手を選択した場合' do
    expect(Task.get_by_status(1)).to include(@task1)
  end

end
