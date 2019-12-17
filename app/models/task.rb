class Task < ApplicationRecord
  validates :title,
    presence: true, presence: {message: "入力してください！"},
    length: { maximum: 10 }

  validates :content,
    length: { maximum: 30 }

  # validates :status,presence: true

  enum status: { "未着手": 1, "着手中": 2, "完了": 3 }
  enum rank: { "低": 1, "中": 2, "高": 3 }

    # タイトルによる絞り込み
  scope :get_by_title, ->(title) {
    where("title like ?", "%#{title}%")
    }
    # ステータスによる絞り込み
  scope :get_by_status, ->(status) {
    where(status: status)
    }

  has_many :labels
  belongs_to :user, optional: true
end
