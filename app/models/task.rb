class Task < ApplicationRecord
  validates :title,
    presence: true, presence: {message: "入力してください！"},
    length: { maximum: 15 }

  validates :content,
    length: { maximum: 100 }

  validates :rank,
    presence: true, presence: {message: "入力してください！"},
    length: { maximum: 5 }

  validates :status,
    presence: true, presence: {message: "入力してください！"},
    length: { maximum: 5 }
end
