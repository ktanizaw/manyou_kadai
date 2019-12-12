require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do

  it 'titleが空ならバリデーションが通らない' do
    task = Task.new(title: '')
    task.valid?
    expect(task.errors[:title]).to include("入力してください！")
  end

  it 'rankが空ならバリデーションが通らない' do
    task = Task.new(rank: '')
    task.valid?
    expect(task.errors[:rank]).to include("入力してください！")
  end

  it 'statusが空ならバリデーションが通らない' do
    task = Task.new(status: '')
    task.valid?
    expect(task.errors[:status]).to include("入力してください！")
  end

  it 'titleとrankとstatusに内容が記載されていればバリデーションが通る' do
    task = Task.new(title: 'テスト', rank: 'テスト', status:'テスト')
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

  it 'rankの文字数が6文字以上だとバリデーションが通らない' do
    task = Task.new(rank: "aaaaaa")
    expect(task).not_to be_valid
  end

  it 'statusの文字数が6文字以上だとバリデーションが通らない' do
    task = Task.new(status: "aaaaaa")
    expect(task).not_to be_valid
  end
end
