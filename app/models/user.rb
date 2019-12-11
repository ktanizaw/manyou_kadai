class User < ApplicationRecord
  validates :name,
    presence: true,  presence: {message: "入力してください！"},
    uniqueness: true, length: { maximum: 30 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true, presence: {message: "入力してください！"},
    uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
