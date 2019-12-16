class Label < ApplicationRecord
  validates :name,
    presence: true, presence: {message: "入力してください！"},
    length: { maximum: 10 }
  validates :content,
        length: { maximum: 30 }
end
