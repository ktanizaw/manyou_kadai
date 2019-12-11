class Label < ApplicationRecord
  validates :name,
    presence: true, presence: {message: "入力してください！"},
    length: { maximum: 30 }
end
