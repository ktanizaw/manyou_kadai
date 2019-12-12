require 'rails_helper'

RSpec.describe 'ラベル管理機能', type: :model do

  it 'nameが空ならバリデーションが通らない' do
    user = User.new(name: '')
    user.valid?
    expect(user.errors[:name]).to include("入力してください！")
  end

  it 'nameの文字数が11文字以上だとバリデーションが通らない' do
    user = User.new(name: "aaaaaaaaaaa")
    expect(user).not_to be_valid
  end

  it 'nameが重複した場合バリデーションが通らない' do
    User.create(
    name: "test",
    email:"test@example.com",
  )
    @user = User.new(
    name: "test",
    email:"test2@example.com",
  )
    @user.valid?
      expect(@user.valid?).to eq(false)
  end

  it 'emailが空ならバリデーションが通らない' do
    user = User.new(email: '')
    user.valid?
    expect(user.errors[:email]).to include("入力してください！")
  end

  it 'emailが重複した場合バリデーションが通らない' do
    User.create(
    name: "test",
    email:"test@example.com",
  )

    @user = User.new(
    name: "test2",
    email:"test@example.com",
  )

  @user.valid?
    expect(@user.valid?).to eq(false)
  end

  it 'emailがemailの形式でなかったならバリデーションが通らない' do
    user = User.new(email: 'aaaaaaa')
    expect(user).not_to be_valid
  end
end
