class Task < ApplicationRecord
  validates :title,
    presence: true, presence: {message: "入力してください！"},
    length: { maximum: 10 }

  validates :content,
    length: { maximum: 30 }

  validates :rank,
    presence: true, presence: {message: "入力してください！"},
    length: { maximum: 5 }

  validates :status,
    presence: true, presence: {message: "入力してください！"},
    length: { maximum: 5 }

  enum status: { "未着手": 0, "着手中": 1, "完了": 2 }
    # タイトルによる絞り込み
  scope :get_by_title, ->(title) {
    where("title like ?", "%#{title}%")
    }
    # ステータスによる絞り込み
  scope :get_by_status, ->(status) {
    where(status: status)
    }
end
