require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do

  it 'titleが空ならバリデーションが通らない' do
    task = Task.new(title: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it 'titleに内容が記載されていればバリデーションが通る' do
    task = Task.new(title: 'テスト', content: 'テスト', rank: 'テスト', deadline:'10', status:'テスト')
    expect(task).to be_valid
  end
end
