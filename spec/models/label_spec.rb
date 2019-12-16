require 'rails_helper'

RSpec.describe 'ラベル管理機能', type: :model do

  it 'nameが空ならバリデーションが通らない' do
    label = Label.new(name: '')
    label.valid?
    expect(label.errors[:name]).to include("入力してください！")
  end

  it 'nameに内容が記載されていればバリデーションが通る' do
    label = Label.new(name: 'テスト')
    expect(label).to be_valid
  end

  it 'nameの文字数が11文字以上だとバリデーションが通らない' do
    label = Label.new(name: "aaaaaaaaaaa")
    expect(label).not_to be_valid
  end

  it 'contentの文字数が30文字以上だとバリデーションが通らない' do
    label = Label.new(content: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    expect(label).not_to be_valid
  end
end
